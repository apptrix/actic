
module Actic
  class Engine < Rails::Engine
    paths.config.app File.expand_path("../../app", __FILE__), :eager_load => true, :glob => "*"
    paths.app.models File.expand_path("../../app/models", __FILE__), :eager_load => true
    paths.app.controllers File.expand_path("../../app/controllers", __FILE__), :eager_load => true
    paths.app.helpers File.expand_path("../../app/helpers", __FILE__), :eager_load => true
    paths.app.views File.expand_path("../../app/views", __FILE__), :eager_load => true
    paths.config.routes File.expand_path("../../config/routes.rb", __FILE__)
    config.autoload_paths << File.expand_path("../../migrate", __FILE__)
    paths.config.initializers File.expand_path("../../config/initializers", __FILE__), :glob => "**/*.rb"


    rake_tasks do
      #load "your_railtie/railties/tasks.rake"
    end

    initializer "icalendar_renderers.initialize" do |app|
      ActionController.add_renderer :ical do |ical, options|
       self.content_type ||= Mime::ICAL
       self.response_body  = ical.respond_to?(:to_ical) ? ical.to_ical(options) : ical
      end

      ActionController.add_renderer :ics do |ical, options|
       self.content_type ||= Mime::ICS
       self.response_body  = ical.respond_to?(:to_ical) ? ical.to_ical(options) : ical
      end
    end

  end
end

=begin
          paths.app                 "app",                 :eager_load => true, :glob => "*"
          paths.app.controllers     "app/controllers",     :eager_load => true
          paths.app.helpers         "app/helpers",         :eager_load => true
          paths.app.models          "app/models",          :eager_load => true
          paths.app.mailers         "app/mailers",         :eager_load => true
          paths.app.views           "app/views"
          paths.lib                 "lib",                 :load_path => true
          paths.lib.tasks           "lib/tasks",           :glob => "**/*.rake"
          paths.config              "config"
          paths.config.initializers "config/initializers", :glob => "**/*.rb"
          paths.config.locales      "config/locales",      :glob => "*.{rb,yml}"
          paths.config.routes       "config/routes.rb"
          paths.public              "public"
          paths.public.javascripts  "public/javascripts"
          paths.public.stylesheets  "public/stylesheets"
          paths
=end