class Event < Component
  acts_as_recurring

  belongs_to :calendar
  has_many :alarms, :as => :owner
  has_many :patterns, :as => :owner
  has_many :r_rules, :as => :owner, :class_name => "Patterns::RRule", :dependent => :destroy
  has_many :r_dates, :as => :owner, :class_name => "Patterns::RDate", :dependent => :destroy
  has_many :ex_rules, :as => :owner, :class_name => "Patterns::ExRule", :dependent => :destroy
  has_many :ex_dates, :as => :owner, :class_name => "Patterns::ExDate", :dependent => :destroy

  def add_rrule_with_unsafe(repeats, args ={})
    _rrule = Patterns::RRule.new(:rule => add_rule(repeats, args))
    self.r_rules << _rrule
    map_rrules
  end
  alias_method_chain :add_rrule, :unsafe

  def add_exrule_with_unsafe(repeats, args ={})
    _exrule = Patterns::ExRule.new(:rule => add_rule(repeats, args))
    self.ex_rules << _exrule
    map_exrules
  end
  alias_method_chain :add_exrule, :unsafe


  def add_rdate_with_unsafe(args)
    _rdate = Patterns::RDate.new(:rule => add_rdate_without_unsafe(args))
    self.r_dates << _rdate
    map_rdates
  end
  alias_method_chain :add_rdate, :unsafe


  def add_exdate_with_unsafe(args)
    _exdate = Patterns::ExDate.new(:rule => add_exdate_without_unsafe(args))
    self.ex_dates << _exdate
    map_exdates
  end
  alias_method_chain :add_exdate, :unsafe

  def map_rrules
    self.component.rrules= self.r_rules.map {|rr| rr.rule }
  end

  def map_exrules
    self.component.exrules= self.ex_rules.map {|ex| ex.rule }
  end

  def map_rdates
    self.component.rdates= self.r_dates.map {|rd| rd.rule }
  end

  def map_exdates
    self.component.exdates= self.ex_dates.map {|exd| exd.rule }
  end

end
