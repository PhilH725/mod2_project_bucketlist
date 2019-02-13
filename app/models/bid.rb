
class Bid < ApplicationRecord

  belongs_to :buyer, class_name: "User"
  belongs_to :auction

  validates :amount, presence: true
  validate :get_top_bid
  validate :seller_exclusion

  def get_top_bid
    @auction = Auction.find(self.auction_id)
    if self.amount <= @auction.top_bid
      errors.add(:bid, "Bid must be greater than the current top bid")
    end
  end

  def seller_exclusion
    @auction = Auction.find(self.auction_id)
    if @auction.seller_id == self.buyer_id
      errors.add(:bid, "You cannot bid on your own auction")
    end
  end

  def clean_bid_time
    date, time = self.created_at.to_s.split(' ')[0..1]
    year, month, day = date.split('-')[0..2]
    "#{time} - #{month}/#{day}/#{year}"
  end

end
