
class Car < ApplicationRecord

  belongs_to :user

  has_many :auctions
  has_many_attached :images
  has_one_attached :avatar

  validates :make, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 1900,
                                                  less_than_or_equal_to: 2020,
                                                  only_integer: true}
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0,
                                                      less_than_or_equal_to: 1000000,
                                                      only_integer: true}

  def display
    #displays make and model together
    "#{self.make} #{self.model}"
  end

  def available
    #checks all auctions the car is a part of and returns false if any of them are active
    #only cars in no active auctions can be listed.
    self.auctions.all?{|i| i.active==false}
  end

end
