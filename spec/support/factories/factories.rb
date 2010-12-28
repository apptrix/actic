Factory.define :calendar do |c|
  c.name "Name"
  c.ical "BEGIN:VCALENDAR\nPRODID;X-RICAL-TZSOURCE=TZINFO:-//com.denhaven2/NONSGML ri_cal gem//EN\nCALSCALE:GREGORIAN\nVERSION:2.0\nEND:VCALENDAR\n"
  c.events {|events| [events.association(:event)]}
  c.journals {|journals| [journals.association(:journal)]}
  # This is to do with the extended association in the calendar definition i think
  #c.alarms {|alarms| [alarms.association(:alarm)]}
  c.todos {|todos| [todos.association(:todo)]}
end

Factory.define :event do |e|
  e.ical "BEGIN:VEVENT\nEND:VEVENT\n"
  e.alarms {|alarms| [alarms.association(:alarm)]}
end

Factory.define :journal do |j|
  j.ical "BEGIN:VJOURNAL\nEND:VJOURNAL\n"
end

Factory.define :todo do |t|
  t.ical "BEGIN:VTODO\nEND:VTODO\n"
end

Factory.define :alarm do |a|
  a.ical "BEGIN:VALARM\nEND:VALARM\n"
  #a.association :owner, :factory => :calendar
  #a.association :owner, :factory => :event
end
#c= Factory(:calendar)
#e= Factory(:event)