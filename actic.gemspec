# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "actic"
  s.summary = "Insert Actic summary."
  s.description = "Insert Actic description."
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.2.1"
  s.rubyforge_project = "actic"

  s.add_dependency('ri_cal', '>= 0.8.7')
  s.add_dependency('recurs')
end