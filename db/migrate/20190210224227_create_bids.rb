class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :amount
      t.integer :auction_id
      t.integer :buyer_id
    end
  end
end
