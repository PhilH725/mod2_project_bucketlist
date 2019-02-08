
class ListingsController < ApplicationController

  before_action :find_params, only: [:edit, :show, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)

      if @user.save
        redirect_to @user
      else
        render :new
      end
  end

  def edit
  end

  def update

    @user.update(user_params)

    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def find_params
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:user_id, :car_id, :description, :title)
  end

end
