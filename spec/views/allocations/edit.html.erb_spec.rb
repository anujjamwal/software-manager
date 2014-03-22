require 'spec_helper'

describe "allocations/edit" do
  before(:each) do
    @allocation = assign(:allocation, stub_model(Allocation,
      :license_id => 1,
      :user_id => 1,
      :project_code => "MyString"
    ))
  end

  it "renders the edit allocation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", allocation_path(@allocation), "post" do
      assert_select "input#allocation_license_id[name=?]", "allocation[license_id]"
      assert_select "input#allocation_user_id[name=?]", "allocation[user_id]"
      assert_select "input#allocation_project_code[name=?]", "allocation[project_code]"
    end
  end
end
