require 'spec_helper'

describe "dummy_resources/show.html.erb" do
  before(:each) do
    @dummy_resource = assign(:dummy_resource, stub_model(DummyResource,
      :suck => "Suck"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Suck/)
  end
end
