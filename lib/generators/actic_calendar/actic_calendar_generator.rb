require 'rails/generators/migration'
#require '../actic_generator'
require File.expand_path("../../actic_generator", __FILE__)

class ActicCalendarGenerator < Rails::Generators::Base

  include Rails::Generators::Migration
  include Actic::Generator

  source_root File.expand_path('../templates', __FILE__)
  argument :name, :type => :string, :default => "calendar"
  argument :attributes, :type => :array, :default => [], :banner => "field:type field:type", :required => false

  def generate_component
    if name.include? ":"
      self.attributes = name
      self.name = "calendar"
      self.attributes = format_attributes(self.attributes)
    end
    template "actic_calendar.rb.txt", "app/models/#{file_name}.rb"
  end

end
