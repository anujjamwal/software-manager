class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :mock_login

  private

  def mock_login
    session['user_id'] = User.first().id if Rails.env.development?
  end
end
