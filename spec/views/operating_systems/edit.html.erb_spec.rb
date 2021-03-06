require 'spec_helper'

describe "operating_systems/edit" do
  before(:each) do
    @operating_system = assign(:operating_system, stub_model(OperatingSystem,
      :name => "MyString"
    ))
  end

  it "renders the edit operating_system form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", operating_system_path(@operating_system), "post" do
      assert_select "input#operating_system_name[name=?]", "operating_system[name]"
    end
  end
end
