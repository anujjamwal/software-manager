module AuthHelper
  def authenticated?
    session['user_id'].present?
  end

  def protected!
    redirect_to("/auth/saml?redirectUrl=#{URI::encode(request.path)}") unless authenticated?
  end

  def current_user
    @user = @user || User.find_by_id(session['user_id'])
  end

  def authorized!
    redirect_to(:unauthorized) unless current_user.role.can?(params[:controller], params[:action])
  end
end
