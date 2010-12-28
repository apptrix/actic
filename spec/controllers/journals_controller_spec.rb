require 'spec_helper'

describe JournalsController do
 describe "GET 'index'" do
   before :each do
     @calendar = Factory(:calendar)
   end
   it "should be successful" do
     get "index", :calendar_id => @calendar.id
     response.should be_success
   end

   it "renders the index template" do
     get :index, :calendar_id => @calendar.id
     response.should render_template('index')
   end

   it "assigns a @journal variable" do
     get :index, :calendar_id => @calendar.id#, :id => e.id
     assigns[:journals].should == @calendar.journals
   end
 end

  describe "GET 'show'" do
    it "should be successful" do
      @cal = Factory.create(:calendar)
      get :show, :calendar_id => @cal.id, :id => @cal.journals.first.id
      response.should be_success
    end
  end

  describe "GET 'new'" do
   before :each do
     @calendar = Factory(:calendar)
   end
    it "should be successful" do
      get "new", :calendar_id => @calendar.id
      response.should be_success
    end
    it "should render template 'new'" do
      get "new", :calendar_id => @calendar.id
      response.should render_template('new')
    end

    it "assigns a new Calendar object" do
      get "new", :calendar_id => @calendar.id
      assigns[:journal].should_not be_nil
      assigns[:journal].should be_kind_of(Journal)
      assigns[:journal].should be_new_record
    end
  end

  describe "POST create" do
    before do
      @calendar = Factory(:calendar)
      @post_params = {:calendar_id => @calendar.id, :journal => {:ical => "BEGIN:VJOURNAL"}}
    end
    it "should assign a @calendar variable" do
      post :create, @post_params
      assigns[:journal].should_not be_nil
      assigns[:journal].should be_kind_of(Journal)
    end

    context "when successful" do
      before do
        @calendar = Factory(:calendar)
        @post_params = {:calendar_id => @calendar.id, :journal => {:ical => "BEGIN:VJOURNAL"}}
        post :create, @post_params
      end
      it "redirects to show" do
        response.should redirect_to([@calendar, Journal.last])#(calendar_journal_path(@calendar, @calendar.journals.last))
      end
      it "creates a calendar record" do
        lambda {
          post :create, @post_params
        }.should change(Journal, :count).by(1)
      end
    end

    context "when failure do" do
      before do
      @calendar = Factory(:calendar)
      @post_params = {:calendar_id => @calendar.id, :journal => {:ical => "BEGIN:VJOURNAL"}}
        @post_params[:journal][:ical] = ''
      end
      it "re-renders the new page" do
        post :create, @post_params
        response.should render_template('new')
      end

      it "does not create a calendar record" do
        lambda {
          post :create, @post_params
        }.should_not change(Journal, :count)
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


