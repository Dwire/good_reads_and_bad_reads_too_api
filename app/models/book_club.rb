class BookClub < ApplicationRecord
  has_many :user_book_clubs
  has_many :users, through: :user_book_clubs
end
