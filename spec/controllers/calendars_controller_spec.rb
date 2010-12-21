require 'spec_helper'

describe CalendarsController do

  def mock_calendar(stubs={})
    (@mock_calendar ||= mock_model(Calendar).as_null_object).tap do |calendar|
      calendar.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all calendars as @calendars" do
      Calendar.stub(:all) { [mock_calendar] }
      get :index
      assigns(:calendars).should eq([mock_calendar])
    end
  end

  describe "GET show" do
    it "assigns the requested calendar as @calendar" do
      Calendar.stub(:find).with("37") { mock_calendar }
      get :show, :id => "37"
      assigns(:calendar).should be(mock_calendar)
    end
  end

  describe "GET new" do
    it "assigns a new calendar as @calendar" do
      Calendar.stub(:new) { mock_calendar }
      get :new
      assigns(:calendar).should be(mock_calendar)
    end
  end

  describe "GET edit" do
    it "assigns the requested calendar as @calendar" do
      Calendar.stub(:find).with("37") { mock_calendar }
      get :edit, :id => "37"
      assigns(:calendar).should be(mock_calendar)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created calendar as @calendar" do
        Calendar.stub(:new).with({'these' => 'params'}) { mock_calendar(:save => true) }
        post :create, :calendar => {'these' => 'params'}
        assigns(:calendar).should be(mock_calendar)
      end

      it "redirects to the created calendar" do
        Calendar.stub(:new) { mock_calendar(:save => true) }
        post :create, :calendar => {}
        response.should redirect_to(calendar_url(mock_calendar))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved calendar as @calendar" do
        Calendar.stub(:new).with({'these' => 'params'}) { mock_calendar(:save => false) }
        post :create, :calendar => {'these' => 'params'}
        assigns(:calendar).should be(mock_calendar)
      end

      it "re-renders the 'new' template" do
        Calendar.stub(:new) { mock_calendar(:save => false) }
        post :create, :calendar => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested calendar" do
        Calendar.should_receive(:find).with("37") { mock_calendar }
        mock_calendar.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :calendar => {'these' => 'params'}
      end

      it "assigns the requested calendar as @calendar" do
        Calendar.stub(:find) { mock_calendar(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:calendar).should be(mock_calendar)
      end

      it "redirects to the calendar" do
        Calendar.stub(:find) { mock_calendar(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(calendar_url(mock_calendar))
      end
    end

    describe "with invalid params" do
      it "assigns the calendar as @calendar" do
        Calendar.stub(:find) { mock_calendar(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:calendar).should be(mock_calendar)
      end

      it "re-renders the 'edit' template" do
        Calendar.stub(:find) { mock_calendar(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested calendar" do
      Calendar.should_receive(:find).with("37") { mock_calendar }
      mock_calendar.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the calendars list" do
      Calendar.stub(:find) { mock_calendar }
      delete :destroy, :id => "1"
      response.should redirect_to(calendars_url)
    end
  end

end
