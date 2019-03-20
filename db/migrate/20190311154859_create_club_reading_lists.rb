class CreateClubReadingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :club_reading_lists do |t|
      t.integer :book_club_id
      t.integer :book_id
      
      t.timestamps
    end
  end
end
