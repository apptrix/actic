require 'rails/generators/migration'
module Actic
  module Generator

    def self.included(base)
      base.send :include, Rails::Generators::Migration
      base.extend(ClassMethods)

      class << base
        private
        def file_name
          name.underscore
        end

        def table_name
          name.tableize
        end

        def format_attributes(attrs)
          fat = []
          a   = attrs
          b   = a.split
          b.each { |c|
            d = c.split(':')
            e = {:name => d[0], :type => d[1]}
            fat << e
          }
          fat
        end

      end

    end

    def self.extended(base)

    end

    module ClassMethods
      def next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end
    end

=begin
    def generate_model
      if name.include? ":"
        self.attributes = name
        self.name       = self.subcomponent
        self.attributes = format_attributes(self.attributes)
      end
      template "component.rb.txt", "app/models/#{file_name}.rb"
    end

    def create_migration_file
      migration_template 'migration.rb.txt', "db/migrate/create_#{table_name}.rb"
    end
=end
  end
end