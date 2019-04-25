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

ActiveRecord::Schema.define(version: 2019_04_25_021437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "charge"
    t.string "comment"
    t.integer "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.bigint "unit_id"
    t.index ["tenant_id"], name: "index_contracts_on_tenant_id"
    t.index ["unit_id"], name: "index_contracts_on_unit_id"
  end

  create_table "dues", force: :cascade do |t|
    t.date "due_date"
    t.bigint "contract_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "automatic"
    t.index ["contract_id"], name: "index_dues_on_contract_id"
  end

  create_table "duties", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified", default: false
    t.index ["location_id"], name: "index_duties_on_location_id"
    t.index ["user_id"], name: "index_duties_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "pay_date"
    t.integer "amount"
    t.bigint "tenant_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified"
    t.string "remark", default: ""
    t.index ["tenant_id"], name: "index_payments_on_tenant_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.index ["location_id"], name: "index_tenants_on_location_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.index ["location_id"], name: "index_units_on_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "role"
  end

  add_foreign_key "contracts", "tenants"
  add_foreign_key "contracts", "units"
  add_foreign_key "dues", "contracts"
  add_foreign_key "duties", "locations"
  add_foreign_key "duties", "users"
  add_foreign_key "locations", "users"
  add_foreign_key "payments", "tenants"
  add_foreign_key "payments", "users"
  add_foreign_key "tenants", "locations"
  add_foreign_key "units", "locations"
end
