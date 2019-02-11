
class AuctionsController < ApplicationController

  layout 'bucketlist_nonuser'

  before_action :get_auction, only: [:edit, :show, :update, :destroy]
  before_action :require_login, only: [:new]

  def index
    @auctions = Auction.all
    if User.find_by(username: session[:username])
      render :layout => 'bucketlist_user'
    end
  end

  def show
    cookies[:view_auction] = @auction.id
    @car = Car.find(@auction.car_id)
    if User.find_by(username: session[:username])
      render :layout => 'bucketlist_user'
    end
  end

  def new
    if @user = User.find_by(username: session[:username])
      @auction = Auction.new
      render :layout => 'bucketlist_user'
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def create
    @auction = Auction.new(title: params[:auction][:title],
                           description: params[:auction][:description],
                           starting_bid: params[:auction][:starting_bid],
                           car_id: params[:auction][:car_id],
                           seller_id: User.find_by(username: session[:username]).id)

    if @auction.save
      @car.active_auction = true
      redirect_to @auction
    else
      render :new
    end
  end

  def edit
    if @user = User.find_by(username: session[:username])
      render :layout => 'bucketlist_user'
    end
  end

  def update

    @auction.update(auction_params)

    if @auction.save
      redirect_to @auction
    else
      render :edit
    end
  end

  def destroy
    @auction.destroy
    redirect_to auctions_path
  end

  private

  def get_auction
    @auction = Auction.find(params[:id])
  end

  def auction_params
    params.require(:auction).permit(:user_id, :description, :title, :car_id, :starting_bid)
  end

  def require_login
    return head(:forbidden) unless session.include? :username
  end

end
