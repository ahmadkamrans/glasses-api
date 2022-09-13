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

ActiveRecord::Schema.define(version: 2022_09_13_055720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "prefixes"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "frames", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "status", default: 0
    t.integer "stock", default: 0
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "currency_id"
    t.index ["currency_id"], name: "index_frames_on_currency_id"
    t.index ["price", "currency_id"], name: "index_frames_on_price_and_currency_id", unique: true
    t.index ["status"], name: "index_frames_on_status"
  end

  create_table "lenses", force: :cascade do |t|
    t.string "color"
    t.text "description"
    t.integer "prescription_type", default: 0
    t.integer "lense_type", default: 0
    t.integer "stock", default: 0
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "currency_id"
    t.index ["currency_id"], name: "index_lenses_on_currency_id"
    t.index ["lense_type"], name: "index_lenses_on_lense_type"
    t.index ["prescription_type"], name: "index_lenses_on_prescription_type"
    t.index ["price", "currency_id"], name: "index_lenses_on_price_and_currency_id", unique: true
    t.index ["price"], name: "index_lenses_on_price"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
  end

  add_foreign_key "frames", "currencies"
  add_foreign_key "lenses", "currencies"
end
