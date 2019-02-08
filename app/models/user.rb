
class User < ApplicationRecord

  has_many :listings
  has_many :cars, through: :listings

end
