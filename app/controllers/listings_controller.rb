
class ListingsController < ApplicationController

  before_action :get_listing, only: [:edit, :show, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
    @car = Car.find_by(listing_id: @listing.id)
  end

  def new
    @listing = Listing.new
    @listing.car = Car.new
    # byebug
  end

  def create
    # byebug
    @listing = Listing.new(title: params[:listing][:title],
                           description: params[:listing][:description],
                           user_id: params[:listing][:user_id])

    @car = Car.new(make: params[:listing][:car][:make],
                      model: params[:listing][:car][:model],
                      color: params[:listing][:car][:color],
                      year: params[:listing][:car][:year],
                      mileage: params[:listing][:car][:mileage],
                      listing_id: @listing.id)

    if @car.valid? && @listing.valid?
      @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def edit
  end

  def update

    @listing.update(listing_params)

    if @listing.save
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def get_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:user_id, :description, :title, car_attributes: [:make,
                                      :model, :color, :year, :mileage])
  end

end
