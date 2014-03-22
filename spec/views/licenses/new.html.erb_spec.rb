require 'spec_helper'

describe "licenses/new" do
  before(:each) do
    assign(:license, stub_model(License,
      :software_id => 1,
      :license_user => "MyString",
      :license => "MyText",
      :user_count => 1,
      :cost => 1
    ).as_new_record)
  end

  it "renders new license form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", licenses_path, "post" do
      assert_select "input#license_software_id[name=?]", "license[software_id]"
      assert_select "input#license_license_user[name=?]", "license[license_user]"
      assert_select "textarea#license_license[name=?]", "license[license]"
      assert_select "input#license_user_count[name=?]", "license[user_count]"
      assert_select "input#license_cost[name=?]", "license[cost]"
    end
  end
end
