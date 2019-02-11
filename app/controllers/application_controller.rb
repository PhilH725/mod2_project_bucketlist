
class ApplicationController < ActionController::Base

  def hello
    if !(User.find_by(username: session[:username]) && session[:password] == User.find_by(username: session[:username]).password)
      redirect_to controller: 'sessions', action: 'new'
    end
  end

end
