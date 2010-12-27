Factory.define :calendar do |c|
  c.name "Name"
  c.ical "BEGIN:VCALENDAR\nPRODID;X-RICAL-TZSOURCE=TZINFO:-//com.denhaven2/NONSGML ri_cal gem//EN\nCALSCALE:GREGORIAN\nVERSION:2.0\nEND:VCALENDAR\n"
  c.events {|events| [events.association(:event)]}
end

Factory.define :event do |e|
  e.ical "BEGIN:VEVENT\nEND:VEVENT\n"
end

#c= Factory(:calendar)
#e= Factory(:event)