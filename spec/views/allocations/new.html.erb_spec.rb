require 'spec_helper'

describe "allocations/new" do
  before(:each) do
    @license = FactoryGirl.create(:license)
    assign(:allocation, stub_model(Allocation,
      :license_id => @license.id,
      :user_id => 1,
      :project_code => "MyString"
    ).as_new_record)
  end

  it "renders new allocation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", license_allocations_path(@license), "post" do
      assert_select "input#allocation_user_id[name=?]", "allocation[user_id]"
      assert_select "input#allocation_project_code[name=?]", "allocation[project_code]"
    end
  end
end
