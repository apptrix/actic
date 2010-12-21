require 'spec_helper'

describe "dummy_resources/index.html.erb" do
  before(:each) do
    assign(:dummy_resources, [
      stub_model(DummyResource,
        :suck => "Suck"
      ),
      stub_model(DummyResource,
        :suck => "Suck"
      )
    ])
  end

  it "renders a list of dummy_resources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Suck".to_s, :count => 2
  end
end
