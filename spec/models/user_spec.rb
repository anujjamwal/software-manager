require 'spec_helper'

describe User do
  describe :associations do
    it {should have_many :allocations}
    it {should have_many(:licenses).through(:allocations)}
  end

  describe :validations do
    it {should validate_uniqueness_of :uid}
  end

  describe :ensure do
    it 'should fetch or create user for uid' do
      uid = '12233'

      expect(User.ensure({'uid' => uid})).to_not be_nil
    end

    it 'should fetch or create user for uid' do
      user = FactoryGirl.create(:user)

      expect(User.ensure({'uid' => user.uid}).id).to be(user.id)
    end
  end
end
