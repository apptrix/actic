require 'spec_helper'

describe Event do
  before :each do
    @event = Event.new
  end

  it "should be a Component" do
    @event.is_a?(Component).should == true
  end

  it "should have a default ical object" do
    @event.component.should == RiCal.Event
  end

  it "should have a start and end date" do
    @event.dtstart
    @event.dtend
  end

  it "should have recurrence schemes" do
    Event.reflect_on_association(:patterns).should_not be_nil
  end

  it "should have recurrence rules" do
    @event.r_rules#.should be_nil
  end

  it "should have excluson rules" do
    @event.ex_rules
  end

  it "should have recurrence dates" do
    @event.r_dates
  end

  it "should have excluson dates" do
    @event.ex_dates
  end

  it "should build a recurrence rule" do
    @event.add_rrule(:daily, :interval => 2, :count => 30)
    @event.r_rules.collect {|r| r.rule }.should == ["FREQ=DAILY;INTERVAL=2;COUNT=30"]
  end

  it "should build an exclusion rule" do
    @event.add_exrule(:daily, :interval => 2, :count => 30)
  end

  it "should build a recurrence date" do
    @event.add_rdate(Date.today)
    @event.add_rdate(:dates => [Date.today, (Date.today+2)])
  end

  it "should build an exclusion date" do
    @event.add_exdate(Date.today)
    @event.add_exdate(:dates => [Date.today, (Date.today+2)])
  end

  it "should build a valid recurrence string from a single rrule" do
    e = RiCal.Event
    e.rrule = "FREQ=DAILY;INTERVAL=2;COUNT=30"
    @event.add_rrule(:daily, :interval => 2, :count => 30)
    @event.component.to_rfc2445_string.should == e.to_rfc2445_string
  end

  it "should build a valid recurrence string from a single rrule and save collection" do
    e = RiCal.Event
    e.rrule = "FREQ=DAILY;INTERVAL=2;COUNT=30"
    @event.add_rrule(:daily, :interval => 2, :count => 30)
    @event.component.to_rfc2445_string.should == e.to_rfc2445_string
    @event.save!.should == true
    @event.r_rules.should_not be_nil
    @event.r_rules.reload
    @event.r_rules.should_not be_nil
    @event.r_rules.each {|rr|
      rr.id.should_not be_nil
      rr.owner_id.should == @event.id }
  end


  it "should build a valid recurrence string from a single exrule" do
    e = RiCal.Event
    e.exrule = "FREQ=DAILY;INTERVAL=2;COUNT=30"
    @event.add_exrule(:daily, :interval => 2, :count => 30)
    @event.component.to_rfc2445_string.should == e.to_rfc2445_string
  end

  it "should build a valid recurrence string from a single rule and a single exrule" do

  end

  it "should build a valid recurrence string from two rrules rule" do

  end

  it "should create patterns and save dependant" do

  end



end
