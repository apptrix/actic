require 'rails/generators/migration'
class ActicCalendarGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)
  argument :name, :type => :string, :default => "calendar"
  argument :attributes, :type => :array, :default => [], :banner => "field:type field:type", :required => false


   def self.next_migration_number(dirname)
     if ActiveRecord::Base.timestamped_migrations
       Time.now.utc.strftime("%Y%m%d%H%M%S")
     else
       "%.3d" % (current_migration_number(dirname) + 1)
     end
   end

   def create_migration_file
     migration_template 'migration.rb.txt', "db/migrate/create_#{table_name}.rb"
   end

  def generate_model
    if name.include? ":"
      self.attributes = name
      self.name = "calendar"
      self.attributes = format_attributes(self.attributes)
    end
    template "actic_calendar.rb.txt", "app/models/#{file_name}.rb"
  end

  private
  def file_name
    name.underscore
  end

  def table_name
    name.tableize
  end

  def format_attributes(attrs)
      fat = []
      a = attrs
      b = a.split
      b.each {|c|
      d = c.split(':')
      e = {:name => d[0], :type => d[1] }
      fat << e
      }
    fat
  end
end
