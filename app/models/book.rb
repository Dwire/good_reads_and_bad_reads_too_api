class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books

  has_many :user_reviews
  # has_many :users, through: :user_reviews

  def conversation
    UserBook.all.select do |user_book|
      user_book.book == self
    end
  end

  def average_rating
    if !self.conversation.empty?
      ratings_array = self.conversation.map do |u_b|
        u_b.reader_rating
      end
      ratings_array.reduce(:+) / ratings_array.length
    else
      "No Ratings"
    end
  end

end
