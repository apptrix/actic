# Every active record model that implements the interface must
# have a string value either in the DB or initialized in memory called "ical"
require 'ri_cal'
module Actic
  def ic_respond
    true
  end
  module Event

  def ic_component
    true
  end

    module ClassMethods; end

    def self.included(base)
      base.extend(ClassMethods)
      base.send :after_initialize, :si
    end

    def ievent
      @ic ? @ic : @ic = RiCal.parse_string(self.ical).first
    end

    def description=(desc)
      ievent.description=desc; si(@ic)
    end

    def description
      ievent.description
    end

    def start_time=(start)
      ievent.dtstart=start; si(@ic)
    end

    def start_time
      ievent.start_time
    end

    def end_time=(endt)
      ievent.dtend=endt; si(@ic)
    end

    def end_time
      ievent.end_time
    end

    def recurrence=(rec)
      ievent.rrule=rec; si(@ic)
    end

    ## e.recurs :freq => :daily, :count => 10
    ## e.recurs :string => "FREQ=WEEKLY;COUNT=10;"
    ## NOTE - if specifying :string, all other options are overridden
    def recurs(opts = {})
      rec = ""

      unless opts[:freq].nil?
        #p "Frequency Present"
        rec += "FREQ=#{opts[:freq].to_s.upcase};"
      end
      unless opts[:count].nil?
        #p "Count Present"
        rec += "COUNT=#{opts[:count].to_i};"
      end
      unless opts[:string].nil?
        #p "String Present"
        rec = opts[:string]
      end
      ievent.rrule=rec; si(@ic)
      #rec
    end

    def occurrences(*oc)
      ievent.occurrences(*oc);
    end

    private

    def set_ievent(ic = nil)
      if !ical.nil? && ic.nil?
        if @ic
          @ic
        else
          @ic = RiCal.parse_string(self.ical).first
        end
      elsif ic.nil?
        self.ical = RiCal.Event.to_rfc2445_string
      else
        @ic = ic; self.ical = @ic.to_rfc2445_string
      end
    end

    alias si set_ievent
  end

  module Calendar
    module ClassMethods; end

    def self.included(base)
      base.extend(ClassMethods)
      base.send :after_initialize, :si
    end

    def icalendar
      @ic ? @ic : @ic = RiCal.parse_string(self.ical).first
    end

    ## Can add a subcomponent as a String, Actic enabled Model, or a RiCal component
    ## If the argument is a Actic Model, attempt to create an association (currently only works with has_many)
    def add_subcomponent(comp)
      i = icalendar
      if comp.is_a? String
        i.add_subcomponent(RiCal.parse_string(comp).first)
      elsif comp.respond_to? "ic_component"
        #p "Item is a subcomponent"
        assoc = comp.class.to_s.downcase.pluralize.to_sym
        if self.class.reflect_on_association assoc
          #p "Item has association - #{assoc.to_s} on self: "
          eval "#{assoc.to_s} << comp"
        else
          p "Item has no association on self"
        end
        i.add_subcomponent(RiCal.parse_string(comp.ievent.to_rfc2445_string).first)
      else
        i.add_subcomponent(RiCal.parse_string(comp.to_rfc2445_string).first)
      end
      si(@ic)
    end

    def events
      icalendar.events
    end

    #  alias event= add_subcomponent
    #def events=(events)
    #  icalendar.events
    #end

    private
    def set_ical(ic = nil)
      if !ical.nil? && ic.nil?
        if @ic
          @ic
        else
          @ic = RiCal.parse_string(self.ical).first
        end
      elsif ic.nil?
        self.ical = RiCal.Calendar.to_rfc2445_string
      else
        @ic = ic; self.ical = @ic.to_rfc2445_string
      end
    end

    alias si set_ical
  end
end