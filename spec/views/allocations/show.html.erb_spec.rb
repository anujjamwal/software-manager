require 'spec_helper'

describe "allocations/show" do
  before(:each) do
    @license = FactoryGirl.create(:license)
    @allocation = assign(:allocation, stub_model(Allocation,
      :license_id => @license.id,
      :user_id => 2,
      :project_code => "Project Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Project Code/)
  end
end
