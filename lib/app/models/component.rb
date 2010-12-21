class Component < ActiveRecord::Base
  attr_accessor :component
  after_initialize :set_component

  def set_component
    @component = self.ical if (self.ical != nil)

    [[Calendar, RiCal.Calendar], [Event, RiCal.Event], [Todo, RiCal.Todo],
     [Journal, RiCal.Journal], [Alarm, RiCal.Alarm], [FreeBusy, RiCal.Freebusy]].each {|comp|

      if self.is_a? comp[0]
        @component ||= comp[1]
        break
      end
    }
    self.ical = @component.to_rfc2445_string if self.ical.nil?
    @component
  end

  def add_component(sub_component)
     if sub_component.is_a? Event
       self.component.events << sub_component.component
     elsif sub_component.is_a? Todo
       self.component.todos << sub_component.component
     elsif sub_component.is_a? Journal
       self.component.journals << sub_component.component
     elsif sub_component.is_a? Alarm
       self.component.alarms << sub_component.component
     elsif sub_component.is_a? FreeBusy
       self.component.freebusys << sub_component.component
     end
     self.ical = self.component.to_rfc2445_string
  end

  def component_names
    self.class.reflect_on_all_associations.map do |a|
      a.name if a.klass.ancestors.include? Component
    end.compact
  end

  def components
    component_names.map {|co| self.send(co).map {|d| d.component }}.flatten
  end

  def reset_component
    self.ical = nil
    self.component = nil
    set_component
    self.components.each {|co|
      self.component.add_subcomponent(co)
    }
  end

  #These methods override ActiveRecords methods
  class << self
  def table_name
    reset_table_name
  end

  def reset_table_name #:nodoc:
     self.table_name = compute_table_name
  end


  def compute_table_name
    base = base_class
    if self == base
      if parent < Component && !parent.abstract_class?
        contained = parent.table_name
        contained = contained.singularize if parent.pluralize_table_names
        contained << '_'
      end
      "#{full_table_name_prefix}#{contained}#{undecorated_table_name(name)}#{table_name_suffix}"
    else
      base.table_name
    end
  end

  def base_class
    class_of_active_record_descendant(self)
  end

  def class_of_active_record_descendant(klass)
    if klass.superclass == Component || klass.superclass.abstract_class?
      klass
    elsif klass.superclass.nil?
      raise ActiveRecordError, "#{name} doesn't belong in a hierarchy descending from ActiveRecord"
    else
      class_of_active_record_descendant(klass.superclass)
    end
  end
  end

end

