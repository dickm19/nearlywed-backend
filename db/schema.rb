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

ActiveRecord::Schema[8.0].define(version: 2025_11_06_184103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "guests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "rsvp"
    t.bigint "wedding_id", null: false
    t.index ["wedding_id"], name: "index_guests_on_wedding_id"
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "registry_id", null: false
    t.integer "quantity", default: 1
    t.decimal "price", precision: 10, scale: 2, null: false
    t.string "description"
    t.boolean "purchased", default: false
    t.string "image_url"
    t.string "category"
    t.string "brand"
    t.string "sku"
    t.string "item_url"
    t.index ["registry_id"], name: "index_items_on_registry_id"
  end

  create_table "registries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "wedding_id", null: false
    t.index ["wedding_id"], name: "index_registries_on_wedding_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "role", default: "nearlywed", null: false
    t.bigint "wedding_id"
    t.string "full_name"
    t.index ["wedding_id"], name: "index_users_on_wedding_id"
  end

  create_table "venues", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.text "description"
    t.bigint "wedding_id", null: false
    t.integer "capacity"
    t.index ["wedding_id"], name: "index_venues_on_wedding_id"
  end

  create_table "weddings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.string "city"
    t.string "state"
    t.string "dress_code"
    t.string "name"
    t.bigint "user_id"
    t.string "couple_names"
    t.index ["user_id"], name: "index_weddings_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "guests", "weddings"
  add_foreign_key "items", "registries"
  add_foreign_key "registries", "weddings"
  add_foreign_key "users", "weddings"
  add_foreign_key "venues", "weddings"
  add_foreign_key "weddings", "users"
end
