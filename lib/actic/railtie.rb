require 'actic'
require 'rails'
module Actic
  class Railtie < Rails::Railtie
    #railtie_name :actic

    initializer "actic_railtie.configure_rails_initialization" do
    end

#    initializer "actic_railtie.configure_rails_initialization",
#      :before => "actice_railtie.blah_init" do
#
#    end
    #config.autoload_paths += %W(models/calendar)

    config.after_initialize do
      #require "models/calendar"
      #require "models/event"
      #require "models/sub_component"
      ## inject actic methods into active record
    end


    config.before_eager_load do
      #SomeClass.set_important_value = "RoboCop"
    end

    # Production only
    config.to_prepare do
      # MyRailtie.setup!
    end

    console do
      # Foo.con_thing!
    end

    generators do

      #require '../../generators/actic/actic_generator'
      #require '../../generators/actic_calendar/actic_calendar_generator'
      #require '../../generators/actic_subcomponent/actic_subcomponent_generator'

    end

    rake_tasks do
     # require 'path/to/railtie.tasks'
    end

  end
end

      # after_initialize
      # app_middleware
      # before_configuration
      # before_eager_load
      # before_initialize
      # generators
      # method_missing
      # new
      # respond_to?
      # to_prepare
      # to_prepare_blocks