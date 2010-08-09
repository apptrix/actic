require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the actic plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the actic plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Actic'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "actic"
    gemspec.summary = "iCalendar wrapper for Active Record objects"
    gemspec.description = ""
    gemspec.email = "steve@apptrix.net"
    gemspec.homepage = "http://github.com/apptrix/actic"
    gemspec.authors = ["Steve Caney"]
    gemspec.files =  FileList["[A-Z]*", "{app,config,lib}/**/*"]
    gemspec.extra_rdoc_files = FileList["[A-Z]*"] - %w(Gemfile Rakefile)
    gemspec.add_dependency("ri_cal", "~> 0.8.7")
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end