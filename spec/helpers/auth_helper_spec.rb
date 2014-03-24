require 'spec_helper'

describe AuthHelper do
  let(:auth_user) { FactoryGirl.create(:user, name: 'Authenticated User', email: 'auth.user@sft.com')}

  describe 'authenticated?' do

    it 'should return true is user id present' do
      controller.session['user_id'] = '1233'

      expect(helper).to be_authenticated
    end

    it 'should return false is user id not present' do
      controller.session['user_id'] = nil

      expect(helper).to_not be_authenticated
    end
  end

  describe :current_user do
    it 'should return the current user based on session user id' do
      controller.session['user_id'] = auth_user.id

      expect(helper.current_user.id).to be(auth_user.id)
    end
  end
end
