
class ListingsController < ApplicationController

  before_action :find_params, only: [:edit, :show, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
    byebug
    @car = @listing.car.build
    # byebug
  end

  def create
    # byebug
    @car = Car.create(make: params[:listing][:cars][:make], model: params[:listing][:cars][:model], color: params[:listing][:cars][:color], year: params[:listing][:cars][:year], mileage: params[:listing][:cars][:mileage])
    @listing = Listing.new(listing_params)

      if @listing.save
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

  def find_params
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:user_id, :description, :title, car_attributes: [:make,
                                      :model, :color, :year, :mileage])
  end

end
