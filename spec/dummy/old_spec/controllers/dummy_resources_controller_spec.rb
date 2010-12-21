require 'spec_helper'

describe DummyResourcesController do

  def mock_dummy_resource(stubs={})
    (@mock_dummy_resource ||= mock_model(DummyResource).as_null_object).tap do |dummy_resource|
      dummy_resource.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all dummy_resources as @dummy_resources" do
      DummyResource.stub(:all) { [mock_dummy_resource] }
      get :index
      assigns(:dummy_resources).should eq([mock_dummy_resource])
    end
  end

  describe "GET show" do
    it "assigns the requested dummy_resource as @dummy_resource" do
      DummyResource.stub(:find).with("37") { mock_dummy_resource }
      get :show, :id => "37"
      assigns(:dummy_resource).should be(mock_dummy_resource)
    end
  end

  describe "GET new" do
    it "assigns a new dummy_resource as @dummy_resource" do
      DummyResource.stub(:new) { mock_dummy_resource }
      get :new
      assigns(:dummy_resource).should be(mock_dummy_resource)
    end
  end

  describe "GET edit" do
    it "assigns the requested dummy_resource as @dummy_resource" do
      DummyResource.stub(:find).with("37") { mock_dummy_resource }
      get :edit, :id => "37"
      assigns(:dummy_resource).should be(mock_dummy_resource)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created dummy_resource as @dummy_resource" do
        DummyResource.stub(:new).with({'these' => 'params'}) { mock_dummy_resource(:save => true) }
        post :create, :dummy_resource => {'these' => 'params'}
        assigns(:dummy_resource).should be(mock_dummy_resource)
      end

      it "redirects to the created dummy_resource" do
        DummyResource.stub(:new) { mock_dummy_resource(:save => true) }
        post :create, :dummy_resource => {}
        response.should redirect_to(dummy_resource_url(mock_dummy_resource))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dummy_resource as @dummy_resource" do
        DummyResource.stub(:new).with({'these' => 'params'}) { mock_dummy_resource(:save => false) }
        post :create, :dummy_resource => {'these' => 'params'}
        assigns(:dummy_resource).should be(mock_dummy_resource)
      end

      it "re-renders the 'new' template" do
        DummyResource.stub(:new) { mock_dummy_resource(:save => false) }
        post :create, :dummy_resource => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested dummy_resource" do
        DummyResource.should_receive(:find).with("37") { mock_dummy_resource }
        mock_dummy_resource.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dummy_resource => {'these' => 'params'}
      end

      it "assigns the requested dummy_resource as @dummy_resource" do
        DummyResource.stub(:find) { mock_dummy_resource(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:dummy_resource).should be(mock_dummy_resource)
      end

      it "redirects to the dummy_resource" do
        DummyResource.stub(:find) { mock_dummy_resource(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(dummy_resource_url(mock_dummy_resource))
      end
    end

    describe "with invalid params" do
      it "assigns the dummy_resource as @dummy_resource" do
        DummyResource.stub(:find) { mock_dummy_resource(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:dummy_resource).should be(mock_dummy_resource)
      end

      it "re-renders the 'edit' template" do
        DummyResource.stub(:find) { mock_dummy_resource(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested dummy_resource" do
      DummyResource.should_receive(:find).with("37") { mock_dummy_resource }
      mock_dummy_resource.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the dummy_resources list" do
      DummyResource.stub(:find) { mock_dummy_resource }
      delete :destroy, :id => "1"
      response.should redirect_to(dummy_resources_url)
    end
  end

end
