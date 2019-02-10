
class User < ApplicationRecord

  # has_many :listings
  # has_many :cars, through: :listings

  has_many :cars
  has_many :auctions, foreign_key: "seller_id"
  has_many :bids, foreign_key: "buyer_id"
  has_many :auctions, through: :bids

end
