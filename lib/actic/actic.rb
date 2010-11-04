#require File.expand_path "../mods/calendar_module", __FILE__
#require_relative 'mods/calendar_module'
module Actic

  def ic_respond
    true
  end
end


Dir[File.expand_path("../components/*", __FILE__)].each {|file| require file }