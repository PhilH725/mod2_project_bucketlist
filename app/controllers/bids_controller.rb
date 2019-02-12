
class BidsController < ApplicationController

  layout 'bucketlist_header'

  def new
    # byebug
    @bid = Bid.new
    @user = logged_user
    @auction = Auction.find_by(id: params[:id])
    # byebug
  end

  def create
    # byebug
    @auction = Auction.find(params[:bid][:auction_id])
    @bid = Bid.create(amount: params[:bid][:amount],
                      buyer_id: params[:bid][:user_id],
                      auction_id: params[:bid][:auction_id])
    redirect_to Auction.find(params[:bid][:auction_id])
  end

  def index
  end

end
