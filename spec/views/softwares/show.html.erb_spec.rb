require 'spec_helper'

describe "softwares/show" do
  before(:each) do
    @software = assign(:software, stub_model(Software,
      :name => "Name",
      :path => "Path",
      :operating_system_id => 1,
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Path/)
    rendered.should match(/1/)
    rendered.should match(/State/)
  end
end
