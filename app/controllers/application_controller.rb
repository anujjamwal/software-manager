class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Authenticable

  def home
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
