class ApplicationController < ActionController::Base
  include AuthHelper
  protect_from_forgery with: :exception

  before_filter :mock_login
  append_before_filter :protected!

  private

  def mock_login
    session['user_id'] = User.first().id if Rails.env.development?
  end
end
