class AddImageToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :image, :string
  end
end
