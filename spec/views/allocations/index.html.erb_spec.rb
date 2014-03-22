require 'spec_helper'

describe "allocations/index" do
  before(:each) do
    assign(:allocations, [
      stub_model(Allocation,
        :license_id => 1,
        :user_id => 2,
        :project_code => "Project Code"
      ),
      stub_model(Allocation,
        :license_id => 1,
        :user_id => 2,
        :project_code => "Project Code"
      )
    ])
  end

  it "renders a list of allocations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Project Code".to_s, :count => 2
  end
end
