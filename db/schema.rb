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

ActiveRecord::Schema.define(version: 20180515154643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enterprises", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inoutputs", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.bigint "sector_id"
    t.bigint "item_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_inoutputs_on_item_id"
    t.index ["sector_id"], name: "index_inoutputs_on_sector_id"
    t.index ["user_id"], name: "index_inoutputs_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.string "description"
    t.integer "patrimony"
    t.bigint "type_id"
    t.bigint "sector_id"
    t.integer "quantity"
    t.bigint "user_id"
    t.boolean "rent"
    t.bigint "enterprise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_items_on_enterprise_id"
    t.index ["sector_id"], name: "index_items_on_sector_id"
    t.index ["type_id"], name: "index_items_on_type_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "secretaries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_secretaries_on_user_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "secretary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["secretary_id"], name: "index_sectors_on_secretary_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inoutputs", "items"
  add_foreign_key "inoutputs", "sectors"
  add_foreign_key "inoutputs", "users"
  add_foreign_key "items", "enterprises"
  add_foreign_key "items", "sectors"
  add_foreign_key "items", "types"
  add_foreign_key "items", "users"
  add_foreign_key "secretaries", "users"
  add_foreign_key "sectors", "secretaries"
end
