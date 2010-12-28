require 'spec_helper'

describe AlarmsController do
 describe "GET 'index'" do
   before :each do
     @event = Factory(:event)
   end
   it "should be successful" do
     get "index", :event_id => @event.id
     response.should be_success
   end

   it "renders the index template" do
     get :index, :event_id => @event.id
     response.should render_template('index')
   end

   it "assigns a @alarm variable" do
     get :index, :event_id => @event.id#, :id => e.id
     assigns[:alarms].should == @event.alarms
   end
 end

  describe "GET 'show'" do
    it "should be successful" do
      @cal = Factory.create(:event)
      get :show, :event_id => @cal.id, :id => @cal.alarms.first.id
      response.should be_success
    end
  end

  describe "GET 'new'" do
   before :each do
     @event = Factory(:event)
   end
    it "should be successful" do
      get "new", :event_id => @event.id
      response.should be_success
    end
    it "should render template 'new'" do
      get "new", :event_id => @event.id
      response.should render_template('new')
    end

    it "assigns a new Event object" do
      get "new", :event_id => @event.id
      assigns[:alarm].should_not be_nil
      assigns[:alarm].should be_kind_of(Alarm)
      assigns[:alarm].should be_new_record
    end
  end

  describe "POST create" do
    before do
      @event = Factory(:event)
      @post_params = {:event_id => @event.id, :alarm => {:ical => "BEGIN:VALARM"}}
    end
    it "should assign a @event variable" do
      post :create, @post_params
      assigns[:alarm].should_not be_nil
      assigns[:alarm].should be_kind_of(Alarm)
    end

    context "when successful" do
      before do
        @event = Factory(:event)
        @post_params = {:event_id => @event.id, :alarm => {:ical => "BEGIN:VALARM"}}
        post :create, @post_params
      end
      it "redirects to show" do
        response.should redirect_to([@event, Alarm.last])#(event_alarm_path(@event, @event.alarms.last))
      end
      it "creates a event record" do
        lambda {
          post :create, @post_params
        }.should change(Alarm, :count).by(1)
      end
    end

    context "when failure do" do
      before do
      @event = Factory(:event)
      @post_params = {:event_id => @event.id, :alarm => {:ical => "BEGIN:VALARM"}}
        @post_params[:alarm][:ical] = ''
      end
      it "re-renders the new page" do
        post :create, @post_params
        response.should render_template('new')
      end

      it "does not create a event record" do
        lambda {
          post :create, @post_params
        }.should_not change(Alarm, :count)
      end
    end
    context "when using a verb other than post" do
      it "rejects the request" do
        # controller.respond_to? :create
        # controller.should_not receive(:create)
        # get :create
        # response.should render_template('new')
      end
    end
  end
end


