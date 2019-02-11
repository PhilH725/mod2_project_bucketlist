
class User < ApplicationRecord

  has_many :cars
<<<<<<< HEAD
  has_many :seller_auctions, :class_name => 'Auction', foreign_key: "seller_id"
  has_many :bids, foreign_key: "buyer_id"
  has_many :buyer_auctions, :class_name => 'Auction', through: :bids, source: :buyer_auctions
=======
  has_many :seller_auctions, :class_name => "Auction", foreign_key: "seller_id"
  has_many :bids, foreign_key: "buyer_id"
  has_many :buyer_auctions, :class_name => "Auction", through: :bids
>>>>>>> 0606eeaacc58f6a370b686183a440e93423f0b04

end
