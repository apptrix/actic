source "http://rubygems.org"

# Specify your gem's dependencies in actic.gemspec
gemspec

#gem "rails", "3.0.0"
if File.exist? File.expand_path('../../rails', __FILE__)
  #gem "rails", "3.0.0", :path => "../rails"
else
  #gem "rails", "3.0.0", :git => "git://github.com/rails/rails.git"
end

platforms :jruby do
  #gem 'activerecord-jdbcsqlite3-adapter'
end

platforms :ruby do
  #gem "sqlite3-ruby"
  if RUBY_VERSION < '1.9'
    #gem "ruby-debug", ">= 0.10.3"
  end
  group :mongoid do
    #gem "mongo"
    #gem "mongoid", :git => "git://github.com/durran/mongoid.git"
    #gem "bson_ext"
  end
end

gem 'ri_cal', :require => 'ri_cal', :git => "git@github.com:tevio/ri_cal.git"