require "spec_helper"

describe DummyResourcesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/dummy_resources" }.should route_to(:controller => "dummy_resources", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/dummy_resources/new" }.should route_to(:controller => "dummy_resources", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/dummy_resources/1" }.should route_to(:controller => "dummy_resources", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/dummy_resources/1/edit" }.should route_to(:controller => "dummy_resources", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/dummy_resources" }.should route_to(:controller => "dummy_resources", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/dummy_resources/1" }.should route_to(:controller => "dummy_resources", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/dummy_resources/1" }.should route_to(:controller => "dummy_resources", :action => "destroy", :id => "1")
    end

  end
end
