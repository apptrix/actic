# Every active record model that implements the interface must
# have a string variable either in the DB or initialized in memory called "ical"


require 'active_support/dependencies'
require 'set'
#require 'actic/models/calendar'
#require 'actic/railtie'
require 'actic/actic'

module Actic
  require 'actic/railtie' if defined?(Rails)
  require 'actic/engine' if defined?(Rails)
  require 'ri_cal'
end

