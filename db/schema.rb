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

ActiveRecord::Schema.define(version: 2021_05_12_231231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer "followee_id"
    t.integer "follower_id"
  end

  create_table "parties", force: :cascade do |t|
    t.bigint "user_id"
    t.string "movie_title"
    t.integer "duration"
    t.date "date"
    t.time "start_time"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viewing_party_guests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "party_id"
    t.index ["party_id"], name: "index_viewing_party_guests_on_party_id"
    t.index ["user_id"], name: "index_viewing_party_guests_on_user_id"
  end

  add_foreign_key "parties", "users"
  add_foreign_key "viewing_party_guests", "parties"
  add_foreign_key "viewing_party_guests", "users"
end
