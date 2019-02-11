
class SessionsController < ApplicationController

  def new
    # @user = User.new
  end

  def create

    return redirect_to(controller: 'sessions', action: 'new') if !params[:username] || params[:username].empty?
    session[:username] = params[:username]
    redirect_to controller: 'auctions', action: 'index'
  end

  def destroy
    session.delete :username
    redirect_to controller: 'sessions', action: 'login'
  end

end
