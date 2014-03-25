require 'spec_helper'

describe "users/show" do
  before(:each) do
    role = FactoryGirl.create(:role, name: 'UserRole')
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :email => "Email",
      :uid => "userid",
      :role => role
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/userid/)
    rendered.should match(/UserRole/)
  end
end
