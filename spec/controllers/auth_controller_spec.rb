require 'spec_helper'

describe AuthController do

  describe "GET 'create'" do
    let(:user) { FactoryGirl.create(:user) }

    it "returns http success" do
      request.env['omniauth.auth'] = {'uid' => user.uid}

      post 'create', provider: 'saml', RelayState: '/homelocation'

      response.should redirect_to('/homelocation')
      expect(session['user_id']).to be(user.id)
    end
  end

end
