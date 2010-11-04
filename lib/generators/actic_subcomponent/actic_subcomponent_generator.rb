require File.expand_path("../../actic_generator", __FILE__)
class ActicSubcomponentGenerator < Rails::Generators::NamedBase
  include Actic::Generator
  source_root File.expand_path('../templates', __FILE__)
  argument :name, :type => :string
  argument :subcomponent, :type => :string, :default => "calendar"
  #argument :actic_calendar, :type => :string, :default => "calendar"
  argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"#, :required => false
  # the generator will generate different sub components based on the 'subcomponent' argument
  def generate_subcomponent
    sc = subcomponent
    self.name.nil? ? self.name = sc : self.name = self.name
    if sc == "calendar"
    elsif sc == "event"
    elsif sc == "journal"
    elsif sc == "todo"
    elsif sc == "alarm"
    end
  end


  def generate_model
    if name.include? ":"
      self.attributes = name
      self.name = self.subcomponent
      #self.attributes = format_attributes(self.attributes)
    end
    template "component.rb.txt", "app/models/#{file_name}.rb"
  end

    def create_migration_file
      #self.attributes = format_attributes(self.attributes)
      migration_template 'migration.rb.txt', "db/migrate/create_#{table_name}.rb"
    end

end
