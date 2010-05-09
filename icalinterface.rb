# Every active record model that implements the ActiveICal interface object must
# have a string value either in the DB or initialized in memory called "ical"
require 'ri_cal'
module Actic
  module Event
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

    def occurrences(oc)
      ievent.occurrences(oc); si(@ic)
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

    def add_subcomponent(comp)
      icalendar.add_subcomponent(RiCal.parse_string(comp).first)
      si(@ic)
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
