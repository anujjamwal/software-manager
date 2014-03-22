require 'spec_helper'

describe "softwares/edit" do
  before(:each) do
    @software = assign(:software, stub_model(Software,
      :name => "MyString",
      :path => "MyString",
      :operating_system_id => 1,
      :download_policy_id => 1,
      :state => "MyString"
    ))
  end

  it "renders the edit software form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", software_path(@software), "post" do
      assert_select "input#software_name[name=?]", "software[name]"
      assert_select "input#software_path[name=?]", "software[path]"
      assert_select "input#software_operating_system_id[name=?]", "software[operating_system_id]"
      assert_select "select#software_download_policy_id[name=?]", "software[download_policy_id]"
    end
  end
end
