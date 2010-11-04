#require File.expand_path "../mods/calendar_module", __FILE__
#require_relative 'mods/calendar_module'
module Actic

  def ic_respond
    true
  end

  def ic_component
    true
  end

  def icomponent
    @ic ? @ic : @ic = RiCal.parse_string(self.ical).first
  end

    ## Can add a subcomponent as a String, Actic enabled Model, or a RiCal component
    ## If the argument is an Actic Model, attempt to create an association (currently only works with has_many)
    def add_subcomponent(comp)
      i = icomponent
      if comp.is_a? String
        i.add_subcomponent(RiCal.parse_string(comp).first)
      elsif comp.respond_to? "ic_component"
        #p "Item is a subcomponent"
        assoc = comp.class.to_s.downcase.pluralize.to_sym
        if self.class.reflect_on_association assoc
          #p "Item has association - #{assoc.to_s} on #{self.class.to_s} "
          eval "#{assoc.to_s} << comp"
        else
          p "Item has no association on self"
        end
        # This is making a call to the actual RiCal add_subcomponent method
        i.add_subcomponent(RiCal.parse_string(comp.ievent.to_rfc2445_string).first)
      else
        i.add_subcomponent(RiCal.parse_string(comp.to_rfc2445_string).first)
      end
      # All changes to the icalendar string are commited back to the ical field
      si(@ic)
    end

end


Dir[File.expand_path("../components/*", __FILE__)].each {|file| require file }