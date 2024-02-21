# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_21_213256) do
  create_table "articles", force: :cascade do |t|
    t.integer "author_id"
    t.string "title"
    t.text "body"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_articles_on_author_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "showtimes", force: :cascade do |t|
    t.datetime "start_datetime"
    t.string "movie_title"
    t.string "external_url"
    t.integer "theater_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theater_id"], name: "index_showtimes_on_theater_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "external_url"
    t.string "address"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"reset_password_token\"", name: "index_users_on_reset_password_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "articles", "authors"
  add_foreign_key "showtimes", "theaters"
end
