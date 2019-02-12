
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
    # @auction = Auction.find(params[:bid][:auction_id])
    @bid = Bid.new(amount: params[:bid][:amount],
                      buyer_id: params[:bid][:user_id],
                      auction_id: params[:bid][:auction_id])
    @bid.save
      redirect_to Auction.find(params[:bid][:auction_id])
    # else
    #   render '/auctions/#{params[:bid][:auction_id]}/bids/new'
    # end
  end

  def index
  end

end
