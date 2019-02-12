
class ApplicationController < ActionController::Base

  helper_method :logged_user

  def logged_user
    User.find_by(id: session[:user_id])
  end

end
