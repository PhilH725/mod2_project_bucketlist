class AddActiveReviewerIdToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :active_reviewer_id, :integer
  end
end
