
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

  def participated_auctions
    Auction.all.select{|i| i.bids.map{|j| j.buyer_id}.include?(self.id)}
  end

  def active_buyer_auctions
    self.participated_auctions.select{|i| i.active}
  end

  def won_auctions
    Auction.all.select{|i| i.active==false && i.auction_winner == self}
  end

  def completed_seller_auctions
    Auction.all.select{|i| i.active==false && i.seller_id == self.id && i.all_auction_bids}
  end

  def active_seller_auctions
    self.seller_auctions.select{|i| i.active}
  end

  def user_history
    participated_auctions + self.seller_auctions
  end



end
