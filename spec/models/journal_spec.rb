require 'spec_helper'

describe Journal do
  before :each do
    @journal = Journal.new
  end

  it "should be a Component" do
    @journal.is_a?(Component).should == true
  end

  it "should have a default ical object" do
    @journal.component.should == RiCal.Journal
  end

  it "should have journal attributes" do
    @journal.dtstart
    @journal.dtend
    @journal.description
    @journal.categories
  end

  it "should accept" do

  end
end