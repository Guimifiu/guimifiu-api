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

ActiveRecord::Schema.define(version: 20171025115134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "api_users", force: :cascade do |t|
    t.string   "name"
    t.string   "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boycott_distributors", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "distributor_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["distributor_id"], name: "index_boycott_distributors_on_distributor_id", using: :btree
  end

  create_table "boycotts", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boycotts_gas_stations", force: :cascade do |t|
    t.integer "gas_station_id"
    t.integer "boycott_id"
    t.index ["boycott_id"], name: "index_boycotts_gas_stations_on_boycott_id", using: :btree
    t.index ["gas_station_id"], name: "index_boycotts_gas_stations_on_gas_station_id", using: :btree
  end

  create_table "distributors", force: :cascade do |t|
    t.string   "name"
    t.string   "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fuel_supplies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gas_station_id"
    t.boolean  "fuelled"
    t.boolean  "boycotted"
    t.decimal  "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "fuel_type"
    t.index ["gas_station_id"], name: "index_fuel_supplies_on_gas_station_id", using: :btree
    t.index ["user_id"], name: "index_fuel_supplies_on_user_id", using: :btree
  end

  create_table "gas_stations", force: :cascade do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.string   "google_maps_id"
    t.string   "vicinity"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "distributor_id"
    t.index ["distributor_id"], name: "index_gas_stations_on_distributor_id", using: :btree
  end

  create_table "price_suggestions", force: :cascade do |t|
    t.integer  "fuel_type"
    t.integer  "user_id"
    t.integer  "gas_station_id"
    t.decimal  "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["gas_station_id"], name: "index_price_suggestions_on_gas_station_id", using: :btree
    t.index ["user_id"], name: "index_price_suggestions_on_user_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gas_station_id"
    t.integer  "stars"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "fuel_supply_id"
    t.index ["fuel_supply_id"], name: "index_ratings_on_fuel_supply_id", using: :btree
    t.index ["gas_station_id"], name: "index_ratings_on_gas_station_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "surname"
    t.string   "document_number"
    t.string   "phone"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "provider"
    t.string   "device_token"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "boycott_distributors", "distributors"
  add_foreign_key "boycotts_gas_stations", "boycotts"
  add_foreign_key "boycotts_gas_stations", "gas_stations"
  add_foreign_key "fuel_supplies", "gas_stations"
  add_foreign_key "fuel_supplies", "users"
  add_foreign_key "gas_stations", "distributors"
  add_foreign_key "price_suggestions", "gas_stations"
  add_foreign_key "price_suggestions", "users"
  add_foreign_key "ratings", "fuel_supplies"
  add_foreign_key "ratings", "gas_stations"
  add_foreign_key "ratings", "users"
end
