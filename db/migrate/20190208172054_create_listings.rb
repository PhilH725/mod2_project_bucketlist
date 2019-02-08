class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.integer :car_id
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
