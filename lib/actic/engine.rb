
module Actic
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("../../app/models", __FILE__)
    config.autoload_paths << File.expand_path("../../migrate", __FILE__)
  end
end