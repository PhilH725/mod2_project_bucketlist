
class Feedback < ApplicationRecord

  belongs_to :reviewer, class_name: "User"
  belongs_to :feedback, class_name: "User"
  belongs_to :auction


    def display_time
      year, month, day = self.created_at.to_s.split(' ')[0].split('-')[0..2]
      "#{month}/#{day}/#{year}"
    end

end
