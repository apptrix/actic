require 'spec_helper'

describe "calendars/edit.html.haml" do
  before(:each) do
    @dummy_resource = assign(:calendar, stub_model(Calendar,
      :name => "Steves Work"
    ))
  end

  it "renders the edit calendar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => calendar_path(@calendar), :method => "post" do
      assert_select "input#calendar_name", :name => "calendar[name]"
    end
  end
end
