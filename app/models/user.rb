
class User < ApplicationRecord

  has_many :cars
  has_many :seller_auctions, :class_name => "Auction", foreign_key: "seller_id"
  has_many :bids, foreign_key: "buyer_id"
  has_many :buyer_auctions, :class_name => "Auction", through: :bids

  validates :username, presence: true#, uniqueness: true, length: {greater_than 3}
  validates :password, presence: true

  has_secure_password

  def available_cars
    self.cars.select{|i| i.auctions.empty?}
  end

end
