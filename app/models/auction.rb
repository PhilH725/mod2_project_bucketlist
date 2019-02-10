
class Auction < ApplicationRecord

  belongs_to :seller, class_name: "User"
  belongs_to :car

  has_many :bids
  has_many :buyers, through: :bids, class_name: "User"

end
