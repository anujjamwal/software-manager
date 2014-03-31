module Authenticable
  extend ActiveSupport::Concern

  included do
    append_before_filter :protected!
    append_before_filter :authorized!
  end

  def authenticated?
    session['user_id'].present?
  end

  def protected!
    case $auth_strategy
      when :cas
        CASClient::Frameworks::Rails::Filter.filter(self)
        self.cas_fix
      when :saml
        redirect_to("/auth/saml?redirectUrl=#{URI::encode(request.path)}") unless authenticated?
    end
  end

  def current_user
    @user = @user || User.find_by_id(session['user_id'])
  end

  def authorized!
    redirect_to(unauthorized_path) unless current_user.can?(params[:controller], params[:action])
  end

  def can?(permission)
    current_user.can?(params[:controller], permission)
  end

  def cas_fix
    @user = User.ensure({'uid' => session['cas_user']})
    session['user_id'] = @user.id
  end
end
