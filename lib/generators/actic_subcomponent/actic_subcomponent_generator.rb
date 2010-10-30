class ActicSubcomponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :subcomponent, :type => :string, :default => "event"
  argument :actic_calendar, :type => :string, :default => "calendar"

  # the generator will generate different sub components based on the 'subcomponent' argument
  def generate_subcomponent
    if subcomponent == "event"
    elsif subcomponent == "journal"

    end
  end
end
