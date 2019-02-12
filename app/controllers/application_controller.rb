
class ApplicationController < ActionController::Base

  helper_method :logged_user

  def logged_user
    User.find_by(username: session[:username])
  end

end
