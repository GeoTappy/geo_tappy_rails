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

ActiveRecord::Schema.define(version: 20141011014203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_providers", force: true do |t|
    t.string   "provider"
    t.string   "provider_account_id"
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auth_providers", ["provider"], name: "index_auth_providers_on_provider", using: :btree
  add_index "auth_providers", ["user_id"], name: "index_auth_providers_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.integer  "user_id"
    t.decimal  "lat",        precision: 9, scale: 6
    t.decimal  "lng",        precision: 9, scale: 6
    t.string   "address"
    t.string   "place_id"
    t.string   "place_name"
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "share_id"
  end

  add_index "locations", ["share_id"], name: "index_locations_on_share_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "mobile_devices", force: true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mobile_devices", ["address"], name: "index_mobile_devices_on_address", using: :btree
  add_index "mobile_devices", ["user_id"], name: "index_mobile_devices_on_user_id", using: :btree

  create_table "shares", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shares", ["location_id"], name: "index_shares_on_location_id", using: :btree
  add_index "shares", ["user_id"], name: "index_shares_on_user_id", using: :btree

  create_table "user_friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_friendships", ["friend_id", "user_id"], name: "index_user_friendships_on_friend_id_and_user_id", unique: true, using: :btree
  add_index "user_friendships", ["friend_id"], name: "index_user_friendships_on_friend_id", using: :btree
  add_index "user_friendships", ["user_id", "friend_id"], name: "index_user_friendships_on_user_id_and_friend_id", unique: true, using: :btree
  add_index "user_friendships", ["user_id"], name: "index_user_friendships_on_user_id", using: :btree

  create_table "user_shares", force: true do |t|
    t.integer  "user_id"
    t.integer  "share_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_shares", ["share_id"], name: "index_user_shares_on_share_id", using: :btree
  add_index "user_shares", ["user_id"], name: "index_user_shares_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_photo_url"
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access_token"
    t.string   "cover_photo_url"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", unique: true, using: :btree

end
