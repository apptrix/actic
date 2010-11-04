module Actic

module SubComponent
  module Event
  include Actic

    module ClassMethods; end

    def self.included(base)
      base.extend(ClassMethods)
      base.send :after_initialize, :si
    end

    def ievent
      icomponent
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
end
end
