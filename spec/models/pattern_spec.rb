require 'spec_helper'

describe Pattern do
  before :each do
    @pattern = Pattern.new
  end

  it "should be a Model" do
    @pattern.is_a?(ActiveRecord::Base).should == true
  end

  it "should have a rule" do
    @pattern.rule
  end

  it "should belong to an owner" do
    Pattern.reflect_on_association(:owner).should_not be_nil
  end
end