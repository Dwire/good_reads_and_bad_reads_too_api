class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
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
