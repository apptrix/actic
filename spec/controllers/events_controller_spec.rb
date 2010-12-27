require 'spec_helper'

describe EventsController do
 describe "GET 'index'" do
   it "should be successful" do
     get "index"
     response.should be_success
   end

   it "renders the index template" do
     get :index
     response.should render_template('index')
   end

   it "assigns a @event variable" do
     e = Factory
   end
 end
end


=begin
  before(:each) do
    @calendar = mock_model(Calendar)
    @events = 6.times{ Factory(:event) }
    #@events.stub!(:all)
    @calendar.stub!(:events).and_return(@events)
    #@calendar.events
    Calendar.stub!(:find).and_return(@calendar)
  end

  def do_get
    get :index, :calendar_id => 1
  end

it "should render index template" do

   do_get
   response.should render_template('index')
end

  it "should build a new event" do
    mock_calendar.stub!(:events).and_return(events =  mock("Array of events"))
    events.should_receive(:new).and_return(mock_event)
    events.should_receive(:find).with("1")

    (@calendar = mock_model(Calendar)).tap do |cal|
      cal.stub!(:events).and_return([mock_model(Event)])
    end


    @calendar.events.should_receive(:new)
    post :create, :event
  end
=end

=begin
  before(:each) do
    #@calendar = Calendar.create
    #5.times {@calendar.events.create }
  end

  def mock_calendar(stubs={})
    (@mock_calendar ||= mock_model(Calendar).as_null_object).tap do |calendar|
      calendar.stub(stubs) unless stubs.empty?
    end
  end


  def mock_event(stubs={})
    (@mock_event ||= mock_model(Event).as_null_object).tap do |event|
      event.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all @calendars events as @events" do
      #@calendar = Calendar.create(:id => 1)
      @calendar.events.stub(:all) { [mock_event] }
      get :index
      assigns(:events).should eq([mock_event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      Event.stub(:find).with("37") { mock_event }
      get :show, :id => "37"
      assigns(:event).should be(mock_event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      Event.stub(:new) { mock_event }
      get :new
      assigns(:event).should be(mock_event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      Event.stub(:find).with("37") { mock_event }
      get :edit, :id => "37"
      assigns(:event).should be(mock_event)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created event as @event" do
        Event.stub(:new).with({'these' => 'params'}) { mock_event(:save => true) }
        post :create, :event => {'these' => 'params'}
        assigns(:event).should be(mock_event)
      end

      it "redirects to the created event" do
        Event.stub(:new) { mock_event(:save => true) }
        post :create, :event => {}
        response.should redirect_to(event_url(mock_event))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        Event.stub(:new).with({'these' => 'params'}) { mock_event(:save => false) }
        post :create, :event => {'these' => 'params'}
        assigns(:event).should be(mock_event)
      end

      it "re-renders the 'new' template" do
        Event.stub(:new) { mock_event(:save => false) }
        post :create, :event => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested event" do
        Event.should_receive(:find).with("37") { mock_event }
        mock_event.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :event => {'these' => 'params'}
      end

      it "assigns the requested event as @event" do
        Event.stub(:find) { mock_event(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:event).should be(mock_event)
      end

      it "redirects to the event" do
        Event.stub(:find) { mock_event(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(event_url(mock_event))
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        Event.stub(:find) { mock_event(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:event).should be(mock_event)
      end

      it "re-renders the 'edit' template" do
        Event.stub(:find) { mock_event(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      Calendars::Event.should_receive(:find).with("37") { mock_event }
      mock_event.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the events list" do
      Calendars::Event.stub(:find) { mock_event }
      delete :destroy, :id => "1"
      response.should redirect_to(events_url)
    end
  end
=end