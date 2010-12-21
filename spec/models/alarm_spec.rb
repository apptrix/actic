require 'spec_helper'

describe Alarm do
  before :each do
    @alarm = Alarm.new
  end
  it "should be a Component" do
    @alarm.is_a?(Component).should == true
  end
end