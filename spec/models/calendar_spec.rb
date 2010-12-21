require 'spec_helper'

describe Calendar do
  before :each do
    @calendar = Calendar.new
  end
  # pending "add some examples to (or delete) #{__FILE__}"
  it "should be a Component" do
    @calendar.is_a?(Component).should == true
  end

  it "should have an ical" do
    cl = RiCal.Calendar
    @calendar.ical.should == cl.to_s
  end

  it "should have a default ical object" do
    cl = RiCal.Calendar
    @calendar.component.should == cl
    @calendar.ical.should == cl.to_rfc2445_string
  end

  it "should infer the ical component through the association" do
    c = RiCal.Calendar
    e = RiCal.Event
    c.events << e
    ev = Event.create
    @calendar.events << ev
    @calendar.events.first.should == ev
    @calendar.component.to_rfc2445_string.should == c.to_rfc2445_string
  end

  it "should have many events" do
    @calendar.save
    @calendar.events << Event.create
    @calendar.events << Event.create
    @calendar.events.count.should == 2
  end

  it "should update component on disconnected saves of associated models" do
    @calendar.save
    e = @calendar.events.new
    e.save
    #@calendar.reload
    @calendar.component.to_s.should eq("BEGIN:VCALENDAR\nPRODID;X-RICAL-TZSOURCE=TZINFO:-//com.denhaven2/NONSGML ri_cal gem//EN\nCALSCALE:GREGORIAN\nVERSION:2.0\nBEGIN:VEVENT\nEND:VEVENT\nEND:VCALENDAR\n")
  end


end
