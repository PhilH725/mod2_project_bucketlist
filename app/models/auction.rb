
class Auction < ApplicationRecord

  belongs_to :seller, class_name: "User"
  belongs_to :car

  has_many :bids
  has_many :buyers, through: :bids, class_name: "User", as: :buyer_auctions

  validates :title, presence: true
  validates :description, presence: true
  validates :starting_bid, numericality: {greater_than: 10}

  def all_auction_bids
    Bid.all.select{|i| i.auction_id == self.id}
  end

  def top_bid
    if !all_auction_bids.empty?
      all_auction_bids.max_by{|i| i.amount}.amount
    else
      self.starting_bid
    end
  end

  def auction_winner
    User.find(all_auction_bids.max_by{|i| i.amount}.buyer_id)
  end

  def end_auction
    bids = all_auction_bids
    if bids.empty?
      self.active=false
      self.save
      nil
    else
      self.process_auction
      self.auction_winner
    end
  end

  def process_auction
    car = Car.find(self.car_id)
    car.user_id = self.auction_winner.id
    car.save
    self.active=false
    self.save
  end


end
