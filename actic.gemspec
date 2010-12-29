# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "actic"
  s.summary = "iCal for ORM"
  s.description = "Actic is a calendaring engine for Rails3, it combines an iCal interface with ORM. It acts as a wrapper around the RiCal library"
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.5.1"
  s.rubyforge_project = "actic"
  s.authors     = ["Steve A Martin"]
  s.email       = ["steve@apptrix.net"]
  s.homepage    = "http://apptrix.net"
  s.summary     = %q{A fusion of ORM and ical}


  s.add_dependency('ri_cal', '>= 0.8.7')
  s.add_dependency('recurs')
  s.add_dependency('haml')
  s.add_dependency('haml-rails')
  s.add_dependency('inherited_resources', '1.1.2')

  s.add_development_dependency('factory_girl')
  s.add_development_dependency('database_cleaner')
end