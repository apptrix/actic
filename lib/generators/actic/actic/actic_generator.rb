require 'rails/generators/migration'

module Actic
  module Generators
    class ActicCalendarGenerator < Rails::Generators::NamedBase
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)
      namespace "actic:calendar"

      desc "Generates a calendar model with the given NAME (if one does not exist) with actic calendar " <<
           "configuration plus a migration file and actic routes."

      def self.orm_has_migration?
        Rails::Generators.options[:rails][:orm] == :active_record
      end

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      class_option :orm
      class_option :migration, :type => :boolean, :default => orm_has_migration?

      def invoke_orm_model
        return unless behavior == :invoke

        if model_exists?
          say "* Model already exists. Adding Actic behavior."
        elsif options[:orm].present?
          invoke "model", [name], :migration => false, :orm => options[:orm]

          unless model_exists?
            abort "Tried to invoke the model generator for '#{options[:orm]}' but could not find it.\n" <<
              "Please create your model by hand before calling `rails g actic #{name}`."
          end
        else
          abort "Cannot create a actic model because config.generators.orm is blank.\n" <<
            "Please create your model by hand or configure your generators orm before calling `rails g actic #{name}`."
        end
      end

      def inject_actic_config_into_model
        actic_class_setup = <<-CONTENT

  # Include default actic calendar module.
  acts_as_calendar

CONTENT

        case options[:orm].to_s
        when "mongoid"
          inject_into_file model_path, actic_class_setup, :after => "include Mongoid::Document\n"
        when "data_mapper"
          inject_into_file model_path, actic_class_setup, :after => "include DataMapper::Resource\n"
        when "active_record"
          inject_into_class model_path, class_name, actic_class_setup + <<-CONTENT
  # Setup accessible (or protected) attributes for your model
  attr_accessible :ical
CONTENT
        end
      end

      def copy_migration_template
        return unless options.migration?
        migration_template "migration.rb", "db/migrate/actic_calendar_create_#{table_name}"
      end

      def add_actic_routes
        route "actic_calendar_for :#{table_name}"
      end

    protected

      def model_exists?
        File.exists?(File.join(destination_root, model_path))
      end

      def model_path
        @model_path ||= File.join("app", "models", "#{file_path}.rb")
      end
    end

    class ActicEventGenerator < Rails::Generators::NamedBase
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)
      namespace "actic:event"

      desc "Generates an event model with the given NAME (if one does not exist) with actic Event" <<
           "configuration plus a migration file and actic routes."

      def self.orm_has_migration?
        Rails::Generators.options[:rails][:orm] == :active_record
      end

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      class_option :orm
      class_option :migration, :type => :boolean, :default => orm_has_migration?

      def invoke_orm_model
        return unless behavior == :invoke

        if model_exists?
          say "* Model already exists. Adding Actic behavior."
        elsif options[:orm].present?
          invoke "model", [name], :migration => false, :orm => options[:orm]

          unless model_exists?
            abort "Tried to invoke the model generator for '#{options[:orm]}' but could not find it.\n" <<
              "Please create your model by hand before calling `rails g actic #{name}`."
          end
        else
          abort "Cannot create a actic model because config.generators.orm is blank.\n" <<
            "Please create your model by hand or configure your generators orm before calling `rails g actic #{name}`."
        end
      end

      def inject_actic_config_into_model
        actic_class_setup = <<-CONTENT

  # Include default actic event module.
  acts_as_event

CONTENT

        case options[:orm].to_s
        when "mongoid"
          inject_into_file model_path, actic_class_setup, :after => "include Mongoid::Document\n"
        when "data_mapper"
          inject_into_file model_path, actic_class_setup, :after => "include DataMapper::Resource\n"
        when "active_record"
          inject_into_class model_path, class_name, actic_class_setup + <<-CONTENT
  # Setup accessible (or protected) attributes for your model
  attr_accessible :ical
CONTENT
        end
      end

      def copy_migration_template
        return unless options.migration?
        migration_template "migration.rb", "db/migrate/actic_create_#{table_name}"
      end

      def add_actic_routes
        route "actic_event_for :#{table_name}"
      end

    protected

      def model_exists?
        File.exists?(File.join(destination_root, model_path))
      end

      def model_path
        @model_path ||= File.join("app", "models", "#{file_path}.rb")
      end
    end
  end
end