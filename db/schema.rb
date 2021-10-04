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

ActiveRecord::Schema.define(version: 2021_10_04_190450) do

  create_table "securities", force: :cascade do |t|
    t.string "ticker"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "pass"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "watch_lists", force: :cascade do |t|
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_watch_lists_on_user_id"
  end

  create_table "watchlist_securities", force: :cascade do |t|
    t.integer "watchList_id", null: false
    t.integer "security_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["security_id"], name: "index_watchlist_securities_on_security_id"
    t.index ["watchList_id"], name: "index_watchlist_securities_on_watchList_id"
  end

  add_foreign_key "watch_lists", "users"
  add_foreign_key "watchlist_securities", "securities"
  add_foreign_key "watchlist_securities", "watchLists"
end
