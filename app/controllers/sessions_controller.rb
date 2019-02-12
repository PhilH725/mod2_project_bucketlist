
class SessionsController < ApplicationController

  def new
    # @user = User.new
  end

  def create

    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session["user_id"] = @user.id
      redirect_to @user
    else
      flash["notice"] = "Invalid logon"
    end

    # return redirect_to(controller: 'sessions', action: 'new') if !params[:username] || params[:username].empty? || !params[:password] || params[:password].empty?
    #
    # session[:username] = params[:username]
    # session[:password] = params[:password]
    # redirect_to controller: 'application', action: 'verify'
    # redirect_to user_path(User.find_by(username: session[:username]))
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
