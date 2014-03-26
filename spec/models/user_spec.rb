require 'spec_helper'

describe User do
  describe :associations do
    it {should belong_to :role}
    it {should have_many :allocations}
    it {should have_many(:licenses).through(:allocations)}
  end

  describe :validations do
    it {should validate_uniqueness_of :uid}
    it {should validate_presence_of :uid}
    it {should validate_presence_of :role}
  end

  describe :ensure do
    it 'should fetch or create user for uid' do
      uid = '12233'
      role = FactoryGirl.create(:role)
      user = User.ensure({'uid' => uid})

      expect(user).to_not be_nil
      expect(user.role.class).to be(Role)
    end

    it 'should fetch or create user for uid' do
      user = FactoryGirl.create(:user)

      expect(User.ensure({'uid' => user.uid}).id).to be(user.id)
    end
  end

  describe :search do
    it 'should search for a user by name and uid' do
      expect(User.search('key').where_values).to eq(["LOWER(name) like '%key%' or LOWER(uid) like '%key%'"])
    end
  end
end
