
class UsersController < ApplicationController

  layout 'bucketlist_user'

  before_action :find_params, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

      if @user.save
        redirect_to @user
      else
        render :new
      end
  end

  # def edit
  # end
  #
  # def update
  # end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def find_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
