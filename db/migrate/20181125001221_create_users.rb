class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.text :email
      t.string :genres, array: true
      t.string :password_digest
      
      t.timestamps
    end
  end
end
