require 'spec_helper'

describe CalendarsController do

  describe "GET 'index'" do
    it "should be successful" do
      get "index"
      response.should be_success
    end

    it "renders the index template" do
      get :index
      response.should render_template('index')
    end

    it "assigns a @calendars variable" do
      c = Factory(:calendar)
      get :index
      assigns[:calendars].should == [c]
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      @cal = Factory.create(:calendar)
      get :show, :id => @cal.id
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get "new"
      response.should be_success
    end
    it "should render template 'new'" do
      get "new"
      response.should render_template('new')
    end

    it "assigns a new Calendar object" do
      get "new"
      assigns[:calendar].should_not be_nil
      assigns[:calendar].should be_kind_of(Calendar)
      assigns[:calendar].should be_new_record
    end
  end

  describe "POST create" do
    before do
      @post_params = {:calendar => {:name => "Test Name"}}
    end
    it "should assign a @calendar variable" do
      post :create, @post_params
      assigns[:calendar].should_not be_nil
      assigns[:calendar].should be_kind_of(Calendar)
    end

    context "when successful" do
      before do
        post :create, @post_params
      end
      it "redirects to show" do
        response.should redirect_to(calendar_path(Calendar.last))
      end
      it "creates a calendar record" do
        lambda {
          post :create, @post_params
        }.should change(Calendar, :count).by(1)
      end
    end

    context "when failure do" do
      before do
        @post_params[:calendar][:ical] = ''
      end
      it "re-renders the new page" do
        post :create, @post_params
        response.should render_template('new')
      end

      it "does not create a calendar record" do
        lambda {
          post :create, @post_params
        }.should_not change(Calendar, :count)
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

  describe "PUT update" do
    before do
      @cal = Factory.create(:calendar)
      @post_params = @cal.attributes
    end
    it "should assign a @calendar variable" do
      put :update, @post_params
      assigns[:calendar].should_not be_nil
      assigns[:calendar].should be_kind_of(Calendar)
    end

    context "when successful" do

      before do
        @calendar = Factory.create(:calendar)
        @post_params = @calendar.attributes
      end

      it "redirects to show" do
        put :update, @post_params
        response.should redirect_to(calendar_path(Calendar.last))
      end

      it "updates a calendar record" do
        @calendar = Factory.create(:calendar)
        @post_params = @calendar.attributes
        put :update, @post_params
        assigns[:calendar].id.should be(@calendar.id)
      end

    end

    context "when failure do" do
#=begin
      before do
        @calendar = Factory.create(:calendar)
        @post_params = @calendar.attributes
        @post_params["ical"] = 1
      end

      it "re-renders the edit page" do
        put :update, @post_params
        response.should be_failure
      end

      it "does not update a calendar record" do
        lambda {
          put :update, @post_params
        }.should_not change(@calendar, :ical).to(1)
      end
#=end
    end

    context "when using a verb other than post" do
      before do
        @calendar = Factory.create(:calendar)
        @post_params = @calendar.attributes
      end

      it "rejects the request" do
        # controller.respond_to? :update
        # controller.should_not receive(:update)
         get :update, @post_params
         response.should be_failure
      end
    end

  end

   describe "DELETE destroy" do
      before do
        @calendar = Factory.create(:calendar)
        @post_params = @calendar.attributes
        @post_params["ical"] = 1
      end
    it "destroys the requested calendar" do
      delete :destroy, :id => @calendar.id
    end

    it "redirects to the calendars list" do
      delete :destroy, :id => @calendar.id
      response.should redirect_to(calendars_url)
    end
  end
end
