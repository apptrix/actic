# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "actic"
  s.summary = "iCal for ORM"
  s.description = "Actic is a calendaring engine for Rails3, it combines an iCal with ORM and acts as a wrapper around the RICal library"
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.2.1.1"
  s.rubyforge_project = "actic"

  s.add_dependency('ri_cal', '>= 0.8.7')
  s.add_dependency('recurs')
end