class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer: :gr_author_id
      t.integer: :gr_book_id
      t.integer: :gr_average_rating

      t.string :image_url
      t.string :small_image_url
      t.string :title
      t.integer :page_count
      t.string :author
      t.text :content
      t.string :url_link
      t.string :genre

      t.timestamps
    end
  end
end
