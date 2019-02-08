
class ListingsController < ApplicationController

  before_action :find_params, only: [:edit, :show, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
    @listing.car = Car.new
    # byebug
  end

  def create
    # byebug
    @car = Car.create(make: params[:listing][:car][:make], model: params[:listing][:car][:model], color: params[:listing][:car][:color], year: params[:listing][:car][:year], mileage: params[:listing][:car][:mileage])
    @listing = Listing.new(title: params[:listing][:title], description: params[:listing][:description], user_id: params[:listing][:user_id])

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
