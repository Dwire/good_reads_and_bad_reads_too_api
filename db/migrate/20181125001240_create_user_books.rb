class CreateUserBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :reader_review
      t.integer :reader_rating
      t.string :reader_suggestion
      t.date :finished_book

      t.timestamps
    end
  end
end
