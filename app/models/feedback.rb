
class Feedback < ApplicationRecord

  belongs_to :reviewer, class_name: "User"
  belongs_to :feedback, class_name: "User"
  belongs_to :auction

end
