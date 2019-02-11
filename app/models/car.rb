
class Car < ApplicationRecord

  belongs_to :user

  has_many :auctions

  def display
    "#{self.make} - #{self.model}"
  end

end
