require 'spec_helper'

describe "softwares/index" do
  before(:each) do
    assign(:softwares, [
      stub_model(Software,
        :name => "Name",
        :path => "Path",
        :operating_system_id => 1,
        :state => "State"
      ),
      stub_model(Software,
        :name => "Name",
        :path => "Path",
        :operating_system_id => 1,
        :state => "State"
      )
    ])
  end

  it "renders a list of softwares" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
