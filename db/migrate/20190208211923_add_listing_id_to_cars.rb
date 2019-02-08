class AddListingIdToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :listing_id, :integer
  end
end
