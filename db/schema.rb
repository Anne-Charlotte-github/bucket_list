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

ActiveRecord::Schema.define(version: 2022_01_10_173229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dreams", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "title"
    t.text "description"
    t.integer "nb_users_min"
    t.integer "nb_users_max"
    t.integer "cost"
    t.boolean "is_hidden"
    t.boolean "is_completed"
    t.bigint "duration_id"
    t.bigint "location_id"
    t.bigint "schedule_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["duration_id"], name: "index_dreams_on_duration_id"
    t.index ["location_id"], name: "index_dreams_on_location_id"
    t.index ["owner_id"], name: "index_dreams_on_owner_id"
    t.index ["schedule_id"], name: "index_dreams_on_schedule_id"
  end

  create_table "dreams_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dream_id", null: false
    t.index ["category_id"], name: "index_dreams_categories_on_category_id"
    t.index ["dream_id"], name: "index_dreams_categories_on_dream_id"
  end

  create_table "durations", force: :cascade do |t|
    t.integer "quantity"
    t.string "unit"
    t.integer "nb_minutes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dream_id", null: false
    t.index ["dream_id"], name: "index_images_on_dream_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean "is_confirmed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dream_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dream_id"], name: "index_teams_on_dream_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dreams", "durations"
  add_foreign_key "dreams", "locations"
  add_foreign_key "dreams", "schedules"
  add_foreign_key "dreams", "users", column: "owner_id"
  add_foreign_key "dreams_categories", "categories"
  add_foreign_key "dreams_categories", "dreams"
  add_foreign_key "images", "dreams"
  add_foreign_key "teams", "dreams"
  add_foreign_key "teams", "users"
end
