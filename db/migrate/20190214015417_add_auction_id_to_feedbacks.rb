class AddAuctionIdToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :auction_id, :integer
  end
end
