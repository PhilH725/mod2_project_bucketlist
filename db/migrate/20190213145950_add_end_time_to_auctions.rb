class AddEndTimeToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :end_time, :datetime
  end
end
