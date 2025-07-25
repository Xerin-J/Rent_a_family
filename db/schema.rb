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

ActiveRecord::Schema[7.1].define(version: 2025_07_25_022453) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_time"
    t.date "end_time"
    t.string "location"
    t.string "event_type"
    t.integer "total_cost"
    t.integer "status"
    t.bigint "user_id", null: false
    t.bigint "family_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_bookings_on_family_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "members"
    t.string "location"
    t.string "event_type"
    t.integer "hourly_rate"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "provider_id"
    t.index ["provider_id"], name: "index_families_on_provider_id"
    t.index ["user_id"], name: "index_families_on_user_id"
  end

  create_table "providers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "some_provider_fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "bookings", "families"
  add_foreign_key "bookings", "users"
  add_foreign_key "families", "providers"
  add_foreign_key "families", "users"
  add_foreign_key "providers", "users"
end
