# require 'rails/generators'
# require 'rails/generators/migration'
require 'rails/generators/active_record'
class ActicInstallGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path("../templates", __FILE__)

#  def self.source_root
#      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
#  end

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end

  def create_migration_file
    migration_template 'migration.rb.tmpl', "db/migrate/create_actic_components.rb"
  end
end

