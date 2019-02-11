
class Bid < ApplicationRecord

  belongs_to :buyer, class_name: "User"
  belongs_to :auction
  #belongs_to :buyer_auction, class_name: "Auction"

end
