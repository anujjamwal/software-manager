class AuthController < ApplicationController
  skip_before_filter :protected!

  def create
    redirect_url = '/'
    case params[:provider]
      when 'saml'
        auth = request.env['omniauth.auth']
        print auth
        user = User.ensure(auth)
        session['user_id'] = user.id
        redirect_url = params[:RelayState] || '/'
    end

    redirect_to redirect_url
  end

  def unauthorized

  end
end
