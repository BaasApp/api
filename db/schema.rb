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

ActiveRecord::Schema.define(version: 20151031202343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beer_tender_updates", force: :cascade do |t|
    t.integer  "beer_tender_id"
    t.string   "uri"
    t.json     "payload"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "beer_tender_updates", ["beer_tender_id"], name: "index_beer_tender_updates_on_beer_tender_id", using: :btree
  add_index "beer_tender_updates", ["uri"], name: "index_beer_tender_updates_on_uri", unique: true, using: :btree

  create_table "beer_tenders", force: :cascade do |t|
    t.string   "device_id"
    t.string   "name"
    t.string   "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "beer_tenders", ["device_id"], name: "index_beer_tenders_on_device_id", unique: true, using: :btree

  create_table "tenders", force: :cascade do |t|
    t.string   "device_id"
    t.string   "name"
    t.string   "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tenders", ["device_id"], name: "index_tenders_on_device_id", unique: true, using: :btree

  create_table "user_updates", force: :cascade do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "user_updates", ["user_id"], name: "index_user_updates_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "push_register_id"
  end

  add_foreign_key "beer_tender_updates", "beer_tenders"
  add_foreign_key "user_updates", "users"
end
