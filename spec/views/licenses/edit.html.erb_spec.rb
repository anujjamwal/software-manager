require 'spec_helper'

describe "licenses/edit" do
  before(:each) do
    @software = FactoryGirl.create(:software)
    @license = assign(:license, stub_model(License,
      :software_id => @software.id,
      :license_user => "MyString",
      :license => "MyText",
      :user_count => 1,
      :cost => 1
    ))
  end

  it "renders the edit license form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", software_license_path(@software, @license), "post" do
      assert_select "input#license_license_user[name=?]", "license[license_user]"
      assert_select "textarea#license_license[name=?]", "license[license]"
      assert_select "input#license_user_count[name=?]", "license[user_count]"
      assert_select "input#license_cost[name=?]", "license[cost]"
    end
  end
end
