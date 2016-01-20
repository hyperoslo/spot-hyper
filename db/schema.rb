# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160119155029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "spots", force: :cascade do |t|
    t.text     "text"
    t.string   "user_name"
    t.integer  "user_id"
    t.string   "tags",         default: [],              array: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "channel_name"
    t.index ["created_at"], name: "index_spots_on_created_at", using: :btree
    t.index ["tags"], name: "index_spots_on_tags", using: :gin
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "spot_id"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ip"], name: "index_votes_on_ip", using: :btree
    t.index ["spot_id"], name: "index_votes_on_spot_id", using: :btree
  end

  add_foreign_key "votes", "spots"
end
