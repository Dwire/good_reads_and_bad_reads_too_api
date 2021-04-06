# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_11_154859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_clubs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer "gr_author_id"
    t.integer "gr_book_id"
    t.integer "gr_average_rating"
    t.string "image_url"
    t.string "small_image_url"
    t.string "title"
    t.integer "page_count"
    t.string "author"
    t.text "content"
    t.string "url_link"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "club_reading_lists", force: :cascade do |t|
    t.integer "book_club_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_book_clubs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_books", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.text "reader_review"
    t.integer "reader_rating"
    t.string "reader_suggestion"
    t.date "finished_book"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_reading_lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.text "email"
    t.string "genres", array: true
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
