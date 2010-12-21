require 'spec_helper'

describe Todo do
  before :each do
    @todo = Todo.new
  end
  it "should be a Component" do
    @todo.is_a?(Component).should == true
  end

  it "should have a default ical string" do
    @todo.component.should == RiCal.Todo
  end
end
