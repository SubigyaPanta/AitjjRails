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

ActiveRecord::Schema.define(version: 20161109172202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_published", default: true
    t.boolean  "is_deleted",   default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "my_stocks", id: false, force: :cascade do |t|
    t.string  "symbol",        limit: 20, null: false
    t.integer "n_shares",                 null: false
    t.date    "date_acquired",            null: false
  end

  create_table "newly_acquired_stocks", id: false, force: :cascade do |t|
    t.string  "symbol",        limit: 20, null: false
    t.integer "n_shares",                 null: false
    t.date    "date_acquired",            null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_product_categories_on_category_id", using: :btree
    t.index ["product_id"], name: "index_product_categories_on_product_id", using: :btree
  end

  create_table "product_photos", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "link",         limit: 512
    t.boolean  "is_primary"
    t.boolean  "is_deleted",               default: false
    t.boolean  "is_published",             default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["product_id"], name: "index_product_photos_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.json     "features"
    t.string   "product_no"
    t.boolean  "is_deleted"
    t.boolean  "is_published"
    t.string   "color"
    t.decimal  "standard_cost",   precision: 8, scale: 2
    t.decimal  "selling_price",   precision: 8, scale: 2
    t.decimal  "weight"
    t.integer  "user_id"
    t.integer  "quantity_total"
    t.integer  "quantity_sold"
    t.date     "sell_start_date"
    t.date     "sell_end_date"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "ps_two_authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ps_two_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ps_two_categories_on_name", unique: true, using: :btree
  end

  create_table "ps_two_quotations", force: :cascade do |t|
    t.integer  "ps_two_authors_id"
    t.integer  "ps_two_categories_id"
    t.text     "quote"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["ps_two_authors_id"], name: "index_ps_two_quotations_on_ps_two_authors_id", using: :btree
    t.index ["ps_two_categories_id"], name: "index_ps_two_quotations_on_ps_two_categories_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_prices", id: false, force: :cascade do |t|
    t.string  "symbol",     limit: 20
    t.date    "quote_date"
    t.integer "price"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "ait_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
    t.index ["ait_id"], name: "index_users_on_ait_id", unique: true, using: :btree
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "product_categories", "categories"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_photos", "products"
  add_foreign_key "products", "users"
  add_foreign_key "ps_two_quotations", "ps_two_authors", column: "ps_two_authors_id"
  add_foreign_key "ps_two_quotations", "ps_two_categories", column: "ps_two_categories_id"
  add_foreign_key "users", "roles"
end
