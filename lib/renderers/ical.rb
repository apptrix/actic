ActionController.add_renderer :ical do |ical, options|
 self.content_type ||= Mime::ICAL
 self.response_body  = ical.respond_to?(:to_ical) ? ical.to_ical(options) : ical
end

ActionController.add_renderer :ics do |ical, options|
 self.content_type ||= Mime::ICS
 self.response_body  = ical.respond_to?(:to_ical) ? ical.to_ical(options) : ical
end