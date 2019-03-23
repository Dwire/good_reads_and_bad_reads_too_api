class User < ApplicationRecord
  has_many :user_books
  has_many :user_reading_lists
  has_many :user_book_clubs
  has_many :books, through: :user_books
  has_many :wish_list_books, through: :user_reading_lists, source: :book
  has_many :book_clubs, through: :user_book_clubs

  has_secure_password

  # has_many :user_reviews
  # has_many :reviewed_books, through: :user_reviews, source: :book

  def to_json
    {
      id: self.id,
      name: self.name,
      email: self.email
    }
  end

end
