
class AuctionsController < ApplicationController

  layout 'bucketlist'

  before_action :get_auction, only: [:edit, :show, :update, :destroy]

  def index
    @auctions = Auction.all
    #byebug
  end

  def show
    @car = Car.find(@auction.car_id)
  end

  def new
    @auction = Auction.new
    # @listing.car = Car.new
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

  def get_auction
    @auction = Auction.find(params[:id])
  end

  def auction_params
    params.require(:auction).permit(:user_id, :description, :title, :car_id, :starting_bid)
  end

end
