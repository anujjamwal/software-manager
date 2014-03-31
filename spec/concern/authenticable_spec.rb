require 'spec_helper'

shared_examples 'authenticable' do
  let(:auth_user) { FactoryGirl.create(:user, name: 'Authenticated User', email: 'auth.user@sft.com')}
  before :each do
    $auth_strategy = :saml
  end

  after :each do
    $auth_strategy = :cas
  end

  describe :authenticated? do

    it 'should return true is user id present' do
      controller.session['user_id'] = '1233'

      expect(controller).to be_authenticated
    end

    it 'should return false is user id not present' do
      controller.session['user_id'] = nil

      expect(controller).to_not be_authenticated
    end
  end

  describe :current_user do
    it 'should return the current user based on session user id' do
      controller.session['user_id'] = auth_user.id

      expect(controller.current_user.id).to be(auth_user.id)
    end
  end

  describe :authorized! do
    it 'should redirect to unauthorized page if permission fail' do
      controller.session['user_id'] = auth_user.id

      controller.stub('current_user' => auth_user)
      auth_user.role.should_receive(:can?).with(controller.params[:controller], controller.params[:action]).and_return(false)
      controller.should_receive(:redirect_to).with(unauthorized_path)

      controller.authorized!
    end

    it 'should not redirect to unauthorized page if permission succeed' do
      controller.session['user_id'] = auth_user.id

      controller.stub('current_user' => auth_user)
      auth_user.role.should_receive(:can?).with(controller.params[:controller], controller.params[:action]).and_return(true)
      controller.should_not_receive(:redirect_to)

      controller.authorized!
    end
  end

  describe :protected! do
    it 'should redirect to okta page if permission fail' do
      controller.should_receive(:authenticated?).and_return(false)
      controller.should_receive(:redirect_to).with('/auth/saml?redirectUrl=')

      controller.protected!
    end

    it 'should not redirect to unauthorized page if permission succeed' do
      controller.should_receive(:authenticated?).and_return(true)
      controller.should_not_receive(:redirect_to)

      controller.protected!
    end
  end
end

