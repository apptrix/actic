# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "actic/version"

Gem::Specification.new do |s|
  s.name        = "actic"
  s.version     = Actic::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steve A Martin"]
  s.email       = ["steve@shakewell.co.uk"]
  s.homepage    = "http://rubygems.org/gems/actic"
  s.summary     = %q{A fusion of ORM and ical}
  s.description = %q{This gem includes the actic orm wrapperb and a series of generators, it is purely for rails 3}

  s.rubyforge_project = "actic"

  s.add_dependency('ri_cal', '>= 0.8.7')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
