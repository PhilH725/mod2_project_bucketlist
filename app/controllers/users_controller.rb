
class UsersController < ApplicationController

  layout 'bucketlist_header'

  before_action :find_user, only: [:show, :destroy, :cars, :auctions]

  def index
    @users = User.all
  end

  def show
    #byebug
  end

  def cars
  end

  def auctions
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

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
