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
        response.should render_template('edit')
      end

      it "does not update a calendar record" do
        lambda {
          put :update, @post_params
        }.should_not change(@calendar, :ical).to(1)
      end
#=end
    end

    context "when using a verb other than post" do
      it "rejects the request" do
        # controller.respond_to? :update
        # controller.should_not receive(:update)
        # get :update
        # response.should render_template('new')
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















=begin
describe CalendarsController do

  #def mock_calendar(stubs={})
    #(@mock_calendar ||= mock_model(Calendar).as_null_object).tap do |calendar|
    #  calendar.stub(stubs) unless stubs.empty?
    #end
  #end

  before(:each) do
    @calendar = Factory.create(:calendar)  # returns an unsaved object
    @id = @calendar.id
  end

  describe "GET index" do
    it "assigns all calendars as @calendars" do
      #Calendar.stub(:all) { [mock_calendar] }
      get :index
      assigns(:calendars).should eq(Calendar.all)
    end
  end

  describe "GET show" do
    it "assigns the requested calendar as @calendar" do
      #Calendar.stub(:find).with("37") { mock_calendar }
      get :show, :id => @id
      assigns(:calendar).id.should be(@calendar.id)
    end
  end

  describe "GET new" do
    it "assigns a new calendar as @calendar" do
      @calendar = Factory.build(:calendar)
      #Calendar.stub(:new) { mock_calendar }
      get :new
      assigns(:calendar).id.should be(@calendar.id)
    end
  end

  describe "GET edit" do
    it "assigns the requested calendar as @calendar" do
      #Calendar.stub(:find).with("37") { mock_calendar }
      get :edit, :id => @id
      assigns(:calendar).id.should be(@calendar.id)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created calendar as @calendar" do
        @calendar = Factory.build(:calendar)
        #Calendar.stub(:new).with({'these' => 'params'}) { mock_calendar(:save => true) }
        post :create, :calendar => { :name => 'Name'}
        assigns(:calendar).should_not be_nil
        assigns[:calendar].should be_kind_of(Calendar)
        assigns[:calendar].should_not be_new_record
      end

      it "redirects to the created calendar" do
        @calendar = Factory.build(:calendar)
        #Calendar.stub(:new) { mock_calendar(:save => true) }
        post :create, :calendar => {}
        assigns(:calendar).should_not be_nil
        assigns[:calendar].should be_kind_of(Calendar)
        assigns[:calendar].should_not be_new_record
        response.should redirect_to(calendar_url(Calendar.last))
      end
    end
#=begin
    describe "with invalid params" do
      it "assigns a newly created but unsaved calendar as @calendar" do
        @calendar = Factory.build(:calendar, :name => Integer)
        # Calendar.stub(:new).with({'these' => 'params'}) { @calendar.save(false) }
        post :create, :calendar => {:name => Integer}
        assigns(:calendar).should be_nil
      end

      it "re-renders the 'new' template" do
        # Calendar.stub(:new) { @calendar(:save => false) }
        post :create, :calendar => {}
        response.should render_template("new")
      end
    end
#=end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested calendar" do
        #Calendar.should_receive(:find).with("37") { mock_calendar }
        #@calendar.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @id, :calendar => {:name => 'Blah'}
      end

      it "assigns the requested calendar as @calendar" do
        #Calendar.stub(:find) { mock_calendar(:update_attributes => true) }
        put :update, :id => @id
        assigns(:calendar).id.should be(@calendar.id)
      end

      it "redirects to the calendar" do
        #Calendar.stub(:find) { mock_calendar(:update_attributes => true) }
        put :update, :id => @id
        response.should redirect_to(calendar_url(@calendar))
      end
    end

#=begin
    describe "with invalid params" do
      it "assigns the calendar as @calendar" do
        #Calendar.stub(:find) { mock_calendar(:update_attributes => false) }
        put :update, :id => @id
        assigns(:calendar).id.should be(@calendar.id)
      end

      it "re-renders the 'edit' template" do
        #Calendar.stub(:find) { mock_calendar(:update_attributes => false) }
        put :update, :id => @id
        response.should render_template("edit")
      end
    end
#=end
  end


  describe "DELETE destroy" do
    it "destroys the requested calendar" do
      #Calendar.should_receive(:find).with("37") { mock_calendar }
      #@calendar.should_receive(:destroy)
      delete :destroy, :id => @id
    end

    it "redirects to the calendars list" do
      #Calendar.stub(:find) { mock_calendar }
      delete :destroy, :id => @id
      response.should redirect_to(calendars_url)
    end
  end

end
=end