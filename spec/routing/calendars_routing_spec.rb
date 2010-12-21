require "spec_helper"

describe CalendarsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/calendars" }.should route_to(:controller => "calendars", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/calendars/new" }.should route_to(:controller => "calendars", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/calendars/1" }.should route_to(:controller => "calendars", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/calendars/1/edit" }.should route_to(:controller => "calendars", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/calendars" }.should route_to(:controller => "calendars", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/calendars/1" }.should route_to(:controller => "calendars", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/calendars/1" }.should route_to(:controller => "calendars", :action => "destroy", :id => "1")
    end

  end
end