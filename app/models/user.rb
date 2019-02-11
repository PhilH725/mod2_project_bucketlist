
class User < ApplicationRecord

  has_many :cars
  has_many :seller_auctions, :class_name => "Auction", foreign_key: "seller_id"
  has_many :bids, foreign_key: "buyer_id"
  has_many :buyer_auctions, :class_name => "Auction", through: :bids

end
