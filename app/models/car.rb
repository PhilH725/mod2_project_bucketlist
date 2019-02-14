
class Car < ApplicationRecord

  belongs_to :user

  has_many :auctions
  has_many_attached :images
  has_one_attached :avatar

  validates :make, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true

  def display
    "#{self.make} - #{self.model}"
  end

  def available
    self.auctions.all?{|i| i.active==false}
  end

end
