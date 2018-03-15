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

ActiveRecord::Schema.define(version: 20180315111815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "zar_balance"
    t.decimal "btc_balance"
    t.decimal "ltc_balance"
    t.decimal "eth_balance"
    t.index ["client_id"], name: "index_accounts_on_client_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.boolean "admin"
    t.decimal "tel"
    t.boolean "mobile_logged_in"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "driver_id"
    t.string "model"
    t.string "make"
    t.string "status"
  end

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "vehicle_reg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "driver_id"
  end

  create_table "clients", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.integer "referral_id"
    t.boolean "admin"
  end

  create_table "currencies", id: :serial, force: :cascade do |t|
    t.integer "currency_type"
    t.float "value"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.decimal "id_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "tel"
    t.string "email"
    t.string "password_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean "admin"
    t.boolean "mobile_logged_in"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "driver_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "admin_id"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zar_transactions", id: :serial, force: :cascade do |t|
    t.string "transaction_type"
    t.decimal "amount"
    t.integer "account_id"
    t.decimal "transaction_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  add_foreign_key "accounts", "clients"
end
