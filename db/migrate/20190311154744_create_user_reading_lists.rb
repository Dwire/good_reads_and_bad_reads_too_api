class CreateUserReadingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reading_lists do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :level

      t.timestamps
    end
  end
end
