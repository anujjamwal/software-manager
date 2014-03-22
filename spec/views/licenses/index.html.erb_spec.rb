require 'spec_helper'

describe "licenses/index" do
  before(:each) do
    assign(:licenses, [
      stub_model(License,
        :software_id => 1,
        :license_user => "License User",
        :license => "MyText",
        :user_count => 2,
        :cost => 3
      ),
      stub_model(License,
        :software_id => 1,
        :license_user => "License User",
        :license => "MyText",
        :user_count => 2,
        :cost => 3
      )
    ])
  end

  it "renders a list of licenses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "License User".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
