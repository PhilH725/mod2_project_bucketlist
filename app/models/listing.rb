
class Listing < ApplicationRecord

  belongs_to :user
  has_one :car

  accepts_nested_attributes_for :car

end
