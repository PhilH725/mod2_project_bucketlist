
class Bid < ApplicationRecord

  belongs_to :buyer, class_name: "User"
  belongs_to :auction

  validates :amount, presence: true
  # validate :get_top_bid

  def get_top_bid
    # # byebug
    # @auction = Auction.find(cookies[:view_auction])
    # if :amount <= @auction.top_bid
    #   errors.add('Bid must be greater than the current top bid')
    # end
  end

end
