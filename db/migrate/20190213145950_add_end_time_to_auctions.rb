class AddEndTimeToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :end_time, :datetime, :default => Time.now + 864000
  end
end
