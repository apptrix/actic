module Actic
  class Engine < Rails::Engine
    #engine_name :actic

    config.autoload_paths << File.expand_path("../models", __FILE__)
  end
end