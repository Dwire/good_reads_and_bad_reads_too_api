class CreateBookClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :book_clubs do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
