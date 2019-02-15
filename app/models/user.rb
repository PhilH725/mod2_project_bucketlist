
class User < ApplicationRecord

  has_many :cars
  has_many :seller_auctions, :class_name => "Auction", foreign_key: "seller_id"
  has_many :bids, foreign_key: "buyer_id"
  has_many :buyer_auctions, :class_name => "Auction", through: :bids

  has_many :reviews, :class_name => "Feedback", foreign_key: "reviewer_id"
  has_many :feedbacks, :class_name => "Feedback", foreign_key: "feedback_id"

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def available_cars
    #returns an array of cars belonging to the owner not currently listed.
    #used for a drop down menu when choosing a car to list.
    self.cars.select{|i| i.available}
  end

  def participated_auctions
    #returns an array of all auctions the user participated in as a buyer, win/lose/active status not considered
    Auction.all.select{|i| i.bids.map{|j| j.buyer_id}.include?(self.id)}
  end

  def active_buyer_auctions
    #returns an array of active auctions the user is participating in as a buyer
    self.participated_auctions.select{|i| i.active}
  end

  def won_auctions
    #returns an array of all auctions the user ended as the highest bidder
    # Auction.all.select{|i| i.active==false && i.auction_winner == self}
    self.participated_auctions.select{|i| !i.active && i.auction_winner == self}
  end

  def completed_seller_auctions
    #returns an array of auctions where the user was the seller, and at least one bid was made.
    #one bid is required for a successful auction with a winning bidder.
    # Auction.all.select{|i| i.active==false && i.seller_id == self.id && i.all_auction_bids}
    self.seller_auctions.select{|i| i.active == false && !i.all_auction_bids.empty?}
  end

  def active_seller_auctions
    #filters out completed seller auctions
    self.seller_auctions.select{|i| i.active}
  end

  def user_history
    #returns an array of all auctions where the user either won as a buyer or successfully sold a car as the seller.
    self.won_auctions + self.completed_seller_auctions
  end

  def average_rating
    #adds all received feedback scores together and finds the average
    (self.feedbacks.map{|i| i.rating}.inject{|i, x| i + x}.to_f / self.feedbacks.size).round(1)
  end

end
