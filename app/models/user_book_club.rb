class UserBookClub < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :book_club, dependent: :destroy
end
