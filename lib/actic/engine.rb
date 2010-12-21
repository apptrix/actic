
module Actic
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("../../app/models", __FILE__)
    #config.autoload_paths << File.expand_path("../../app/views", __FILE__)
    #config.autoload_paths << File.expand_path("../../app/views/calendars", __FILE__)
    config.autoload_paths << File.expand_path("../../app/controllers", __FILE__)
    config.autoload_paths << File.expand_path("../../migrate", __FILE__)
    config.autoload_paths << File.expand_path("../../app/helpers", __FILE__)

    paths.config.routes = File.expand_path("../../config/routes.rb", __FILE__)
    paths.app.views = File.expand_path("../../app/views", __FILE__)

   # paths.config.app  = File.expand_path("../../app", __FILE__)

    rake_tasks do
      #load "your_railtie/railties/tasks.rake"
    end

  end
end