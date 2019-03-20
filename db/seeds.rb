# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Book.destroy_all
UserBook.destroy_all
UserReadingList.destroy_all

BookClub.destroy_all
UserBookClub.destroy_all
ClubReadingList.destroy_all


# UserReview.destroy_all


fam_users = %w(Robin Greg Brandon Forrest Eva Amelia David Joan Rose Tedd)
work_users = %w(Matt Tashawn Ryan May Michelle GiGi Jane Prince Graham Kevin)

fam_users.each do |user|
  User.create(
    name: user,
    email: "#{user}@g.com",
    bio: Faker::TvShows::GameOfThrones.quote,
    genres: [Faker::Book.genre, Faker::Book.genre],
    password: 'pass123'
  )
end

work_users.each do |user|
  User.create(
    name: user,
    email: "#{user}@g.com",
    bio: Faker::TvShows::GameOfThrones.quote,
    genres: [Faker::Book.genre, Faker::Book.genre],
    password: 'pass123'
  )
end

100.times do
  Book.create(
    title: Faker::Book.title,
    genre: Faker::Book.genre,
    author: Faker::Book.author,
    page_count: rand(100..1000),
    content: Faker::Lorem.paragraph(2),
    url_link: Faker::LoremPixel.image("50x60")
  )
end

200.times do
  UserBook.create(
    user: User.all.sample,
    book: Book.all.sample,
    reader_review: Faker::TvShows::Friends.quote,
    reader_rating: rand(1..5),
    finished_book: Faker::Date.between(1.year.ago, Date.today)
  )
end

50.times do
  UserReadingList.create(
    user: User.all.sample,
    book: Book.all.sample,
  )
end

BookClub.create(name: 'The Fam')
BookClub.create(name: 'ALBC')

20.times do
    UserBookClub.create(user: User.all.sample, book_club: BookClub.all.sample)
end


30.times do
  ClubReadingList.create(book_id: Book.all.sample.id, book_club_id: BookClub.all.sample.id)
end


# 50.times do
#   UserReview.create(
#     user: User.all.sample,
#     book: Book.all.sample,
#     content: Faker::GreekPhilosophers.quote,
#     rating: rand(1..5)
#   )
# end
