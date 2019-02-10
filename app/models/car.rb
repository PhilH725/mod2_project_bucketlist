
class Car < ApplicationRecord

  # belongs_to :listing
  # has_many :users, through: :listings

  belongs_to :user

  has_many :auctions

end
