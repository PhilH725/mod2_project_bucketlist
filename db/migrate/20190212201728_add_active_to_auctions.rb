class AddActiveToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :active, :boolean, :default => true
  end
end
