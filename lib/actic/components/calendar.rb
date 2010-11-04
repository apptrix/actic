module Actic
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
    ## If the argument is an Actic Model, attempt to create an association (currently only works with has_many)
    def add_subcomponent(comp)
      i = icalendar
      if comp.is_a? String
        i.add_subcomponent(RiCal.parse_string(comp).first)
      elsif comp.respond_to? "ic_component"
        #p "Item is a subcomponent"
        assoc = comp.class.to_s.downcase.pluralize.to_sym
        if self.class.reflect_on_association assoc
          #p "Item has association - #{assoc.to_s} on #{self.class.to_s} "
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
    # This method leverages the RiCal.Calendar class to create
    # an icalendar string or to parse
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