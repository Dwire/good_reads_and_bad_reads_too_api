class BookClub < ApplicationRecord
  has_many :user_book_clubs
  has_many :users, through: :user_book_clubs

  def to_json
    {
      id: self.id,
      name: self.name,
      members: self.users.map do |user|
        user.to_json
      end
    }
  end
end
