require 'spec_helper'

describe "dummy_resources/edit.html.erb" do
  before(:each) do
    @dummy_resource = assign(:dummy_resource, stub_model(DummyResource,
      :suck => "MyString"
    ))
  end

  it "renders the edit dummy_resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dummy_resource_path(@dummy_resource), :method => "post" do
      assert_select "input#dummy_resource_suck", :name => "dummy_resource[suck]"
    end
  end
end
