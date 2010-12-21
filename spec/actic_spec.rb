require 'spec_helper'

describe Actic do
  it "should be valid" do
    Actic.should be_a(Module)
  end

  it "should be a valid engine" do
    Actic::Engine.should be_a(Class)
    Actic::Engine.new.should be_a(Rails::Engine)
  end
end