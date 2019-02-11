
class BidsController < ApplicationController

  def new
    # byebug
    @bid = Bid.new
    @user = logged_user
    @auction = Auction.find(cookies[:view_auction].to_i)
    # byebug
  end

  def create
    # byebug
    @bid = Bid.create(amount: params[:bid][:amount],
                      buyer_id: params[:bid][:user_id],
                      auction_id: params[:bid][:auction_id])
    redirect_to auctions_path
  end

  def index
  end

end
