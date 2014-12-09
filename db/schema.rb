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

ActiveRecord::Schema.define(version: 20141209111326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "box_sessions", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.integer  "flat_id"
    t.integer  "box_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "box_sessions", ["box_id"], name: "index_box_sessions_on_box_id", using: :btree
  add_index "box_sessions", ["flat_id"], name: "index_box_sessions_on_flat_id", using: :btree

  create_table "boxes", force: true do |t|
    t.integer  "electroscope_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_types", force: true do |t|
    t.string   "type"
    t.float    "avg_daily_consumption"
    t.float    "avg_monthly_consumption_01"
    t.float    "avg_yearly_consumption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.integer  "devicetype_id"
    t.integer  "flat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["devicetype_id"], name: "index_devices_on_devicetype_id", using: :btree
  add_index "devices", ["flat_id"], name: "index_devices_on_flat_id", using: :btree

  create_table "flats", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street_number"
    t.string   "route"
    t.string   "locality"
    t.string   "administrative_area_level_1"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "number_of_occupants"
    t.float    "surface"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "last_yearly_bill"
    t.float    "avg_monthly_consumption_02"
    t.float    "avg_monthly_consumption_03"
    t.float    "avg_monthly_consumption_04"
    t.float    "avg_monthly_consumption_05"
    t.float    "avg_monthly_consumption_06"
    t.float    "avg_monthly_consumption_07"
    t.float    "avg_monthly_consumption_08"
    t.float    "avg_monthly_consumption_09"
    t.float    "avg_monthly_consumption_10"
    t.float    "avg_monthly_consumption_11"
    t.float    "avg_monthly_consumption_12"
    t.integer  "user_id"
  end

  add_index "flats", ["user_id"], name: "index_flats_on_user_id", using: :btree

  create_table "offers", force: true do |t|
    t.float    "price"
    t.text     "conditions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.datetime "creation_date"
    t.string   "status"
    t.string   "counter_type"
    t.string   "delivery_option"
    t.integer  "offer_id"
    t.integer  "box_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street_number"
    t.string   "route"
    t.string   "locality"
    t.string   "administrative_area_level_1"
    t.string   "postal_code"
    t.string   "country"
  end

  add_index "orders", ["box_id"], name: "index_orders_on_box_id", using: :btree
  add_index "orders", ["offer_id"], name: "index_orders_on_offer_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "sponsorships", force: true do |t|
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.datetime "date"
    t.string   "status"
    t.integer  "box_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sponsorships", ["box_id"], name: "index_sponsorships_on_box_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                       default: "", null: false
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "name"
    t.date     "birthday"
    t.string   "street_number"
    t.string   "route"
    t.string   "locality"
    t.string   "administrative_area_level_1"
    t.string   "postal_code"
    t.string   "country"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "civility"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
