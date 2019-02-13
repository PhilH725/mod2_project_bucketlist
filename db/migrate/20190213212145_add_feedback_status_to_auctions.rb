class AddFeedbackStatusToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :feedback_status, :boolean, :default => false
    add_column :auctions, :review_status, :boolean, :default => false
  end
end
