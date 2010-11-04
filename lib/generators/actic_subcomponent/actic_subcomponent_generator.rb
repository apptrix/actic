require '../actic_generator'
class ActicSubcomponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :name, :type => :string
  argument :subcomponent, :type => :string, :default => "calendar"
  argument :actic_calendar, :type => :string, :default => "calendar"

  # the generator will generate different sub components based on the 'subcomponent' argument
  def generate_subcomponent
    sc = subcomponent
    if sc == "calendar"

    elsif sc == "event"
      migration_template 'event_migration.rb.txt', "db/migrate/create_#{table_name}.rb"
    elsif sc == "journal"
    elsif sc == "todo"
    elsif sc == "alarm"
    end
  end
end
