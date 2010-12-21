require 'spec_helper'

describe "dummy_resources/new.html.erb" do
  before(:each) do
    assign(:dummy_resource, stub_model(DummyResource,
      :suck => "MyString"
    ).as_new_record)
  end

  it "renders new dummy_resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dummy_resources_path, :method => "post" do
      assert_select "input#dummy_resource_suck", :name => "dummy_resource[suck]"
    end
  end
end
