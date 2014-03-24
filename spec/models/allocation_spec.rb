require 'spec_helper'

describe Allocation do
  it {should belong_to :license}
  it {should belong_to :user}

  describe :validations do

    let(:license) {FactoryGirl.create(:license)}
    let(:user) {FactoryGirl.create(:user)}

    it {should validate_presence_of :license}
    it {should validate_presence_of :user}

    it 'should not allow license allocation incase license is not available' do
      license.stub(available?: false )

      allocation = Allocation.new license: license, user: user, project_code: 'project_code'

      expect(allocation.save).to be_false
      expect(allocation.errors['license'].first).to eq("unavailable for allocation")
    end
  end
end
