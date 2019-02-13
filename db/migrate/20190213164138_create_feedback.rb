class CreateFeedback < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.text :content
      t.integer :reviewer_id
      t.integer :feedback_id

      t.timestamps
    end
  end
end
