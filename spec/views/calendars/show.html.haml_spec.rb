require 'spec_helper'

describe "calendars/show.html.haml" do
  before(:each) do
    @calendar = assign(:calendar, stub_model(Calendar,
      :name => "Steves Work"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
