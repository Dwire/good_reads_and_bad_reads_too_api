class CreateUserBookClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_book_clubs do |t|
      t.integer :user_id
      t.integer :book_club_id

      t.timestamps
    end
  end
end
