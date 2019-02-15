
class Auction < ApplicationRecord

  belongs_to :seller, class_name: "User"
  belongs_to :car

  has_many :bids
  has_many :buyers, through: :bids, class_name: "User", as: :buyer_auctions

  has_many :feedbacks

  validates :title, presence: true
  validates :description, presence: true
  validates :starting_bid, numericality: {greater_than: 10}
  validates :car_id, presence: true

  after_create :set_end_time

  def set_end_time
    #method that runs after an auction creation that sets the end time to 10 days later
    self.end_time = Time.now + 860000
    self.save
  end

  def self.failed_auctions
    #returns an array of all auctions that started and ended without a bid being made.
    #these auctions do not have a buyer/winner, and the car does not change ownership.
    Auction.all.select{|i| !i.active && i.all_auction_bids.empty?}
  end

  def all_auction_bids
    #helper method that returns an array of all bids on the calling auction.
    Bid.all.select{|i| i.auction_id == self.id}
  end

  def count_bids
    #returns the number of bids made on the calling auction.
    all_auction_bids.size
  end

  def top_bid
    #returns the current bid to beat for the calling auction. if any bids have been made, the highest amount is taken,
    #otherwise the starting amount is the top bid.
    #this is used for display purposes, as it returns the integer amount, not the bid.
    if !all_auction_bids.empty?
      all_auction_bids.max_by{|i| i.amount}.amount
    else
      self.starting_bid
    end
  end

  def auction_leader
    #returns the user who currently owns the bid of the highest amount
    #returns nil if no bids have been made
    if !all_auction_bids.empty?
      User.find(all_auction_bids.max_by{|i| i.amount}.buyer_id)
    end
  end

  def auction_winner
    #returns the final highest bidder of an auction that ended successfully (with at least one bid)
    if !Auction.failed_auctions.include?(self)
      User.find(all_auction_bids.max_by{|i| i.amount}.buyer_id)
    end
  end

  def end_auction
    #ends an auction by setting its active status to false. if no bids have been made, the function saves and returns nil
    #otherwise, the auction is processed and the car ownership is transferred and the winning user is returned
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
    #changes car owner_id to the auction winner and saves. then changes the auction status to false and saves.
    car = Car.find(self.car_id)
    car.user_id = self.auction_winner.id
    car.save
    self.active=false
    self.save
  end

  def clean_datetime(dt)
    #takes a datetime instance and displays the date and time in a readable format
    date, time = dt.to_s.split(' ')[0..1]
    year, month, day = date.split('-')[0..2]
    "#{month}/#{day}/#{year} - #{time}"
  end

  def display_end_date
    #displays just the auction end date in a readable manner
    year, month, day = self.end_time.to_s.split(' ')[0].split('-')[0..2]
    "#{month}/#{day}/#{year}"
  end

end
