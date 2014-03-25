require 'spec_helper'

describe Role do
  describe :validations do
    it {should validate_uniqueness_of :name}
  end

  describe :can? do
    let(:role) {Role.new(permissions: {software: [:new]})}

    it 'should return true if the mentioned controller and action are in list of permissions' do
      permission = role.can? :software, :new

      expect(permission).to be_true
    end

    it 'should return false if the mentioned controller and action are not in list of permissions' do
      permission = role.can? :software, :create

      expect(permission).to be_false
    end
  end
end
