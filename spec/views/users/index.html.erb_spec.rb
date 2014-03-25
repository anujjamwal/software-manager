require 'spec_helper'

describe "users/index" do
  before(:each) do
    role = FactoryGirl.create(:role, name: 'UserRole')
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :uid => "userid",
        :role => role
      ),
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :uid => "userid",
        :role => role
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "userid".to_s, :count => 2
    assert_select "tr>td", :text => "UserRole".to_s, :count => 2
  end
end
