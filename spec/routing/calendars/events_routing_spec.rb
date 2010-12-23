require "spec_helper"

describe EventsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/calendars/1/events" }.should route_to(:controller => "events", :action => "index", :calendar_id => "1")
    end

    it "recognizes and generates #new" do
      { :get => "/calendars/1/events/new" }.should route_to(:controller => "events", :action => "new", :calendar_id => "1")
    end

    it "recognizes and generates #show" do
      { :get => "/calendars/1/events/1" }.should route_to(:controller => "events", :action => "show", :calendar_id => "1", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/calendars/1/events/1/edit" }.should route_to(:controller => "events", :action => "edit", :calendar_id => "1", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/calendars/1/events" }.should route_to(:controller => "events", :action => "create", :calendar_id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "/calendars/1/events/1" }.should route_to(:controller => "events", :action => "update", :calendar_id => "1", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/calendars/1/events/1" }.should route_to(:controller => "events", :action => "destroy", :calendar_id => "1", :id => "1")
    end

  end
end