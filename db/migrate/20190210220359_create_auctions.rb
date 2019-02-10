class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.integer :seller_id
      t.integer :car_id
      t.string :title
      t.text :description
      t.integer :starting_bid

      t.timestamps
    end
  end
end
