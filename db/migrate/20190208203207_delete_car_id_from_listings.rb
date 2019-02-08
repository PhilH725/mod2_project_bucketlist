
class DeleteCarIdFromListings < ActiveRecord::Migration[5.2]

  def change
    remove_column :listings, :car_id
  end
  
end
