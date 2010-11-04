module Actic
  module Calendar
    include Actic
    module ClassMethods; end

    # For any Class the module is included ( mixed in ) into
    def self.included(base)
      base.extend(ClassMethods)
      # execute the set_ical method on object initialization
      base.send :after_initialize, :si
    end

    # This method fetches the ical string and parses it into an instance of RiCal::Componet::Calendar
    def icalendar
      icomponent
    end
    #  @ic ? @ic : @ic = RiCal.parse_string(self.ical).first
    #end


    def events
      icomponent.events
    end

    #  alias event= add_subcomponent
    #def events=(events)
    #  icalendar.events
    #end

    private
    # This method is triggered every time an object implementing this module
    # is instantiated
    # This method updates the existing ical string with new values
    # or creates one from a RiCal.Calendar if its not already present
    #
    def set_icomponent(ic = nil)
      # if the ical value already exists ( not a new model ) and this is being called during initialization
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

    alias si set_icomponent
  end
end