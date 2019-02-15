
class Feedback < ApplicationRecord

  belongs_to :reviewer, class_name: "User"
  belongs_to :feedback, class_name: "User"
  belongs_to :auction

  validates :content, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0,
                                                     less_than_or_equal_to: 5,
                                                     only_integer: true }

  def display_time
    #displays the created at time in a more readable manner
    year, month, day = self.created_at.to_s.split(' ')[0].split('-')[0..2]
    "#{month}/#{day}/#{year}"
  end

end
