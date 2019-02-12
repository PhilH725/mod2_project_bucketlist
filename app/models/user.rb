
class User < ApplicationRecord

  has_many :cars
  has_many :seller_auctions, :class_name => "Auction", foreign_key: "seller_id"
  has_many :bids, foreign_key: "buyer_id"
  has_many :buyer_auctions, :class_name => "Auction", through: :bids

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def available_cars
    self.cars.select{|i| i.available}
  end

  def won_auctions
    Auction.all.select{|i| i.active==false && i.auction_winner == self}
  end

  def completed_seller_auctions
    Auction.all.select{|i| i.active==false && i.seller_id == self.id && i.all_auction_bids}
  end

  def user_history
    won_auctions + completed_seller_auctions
  end



end
