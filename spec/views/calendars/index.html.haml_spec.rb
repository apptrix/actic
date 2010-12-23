require 'spec_helper'

describe "calendars/index.html.haml" do
  before(:each) do
    assign(:calendars, [
      stub_model(Calendar,
        :name => "Steves Work"
      ),
      stub_model(Calendar,
        :name => "Steves Work"
      )
    ])
  end

  it "renders a list of calendars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
