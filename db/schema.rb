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

ActiveRecord::Schema[7.1].define(version: 2024_05_27_184014) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.string "image_url"
    t.bigint "user_id", null: false
    t.boolean "custom_string1_state"
    t.string "custom_string1_name"
    t.boolean "custom_string2_state"
    t.string "custom_string2_name"
    t.boolean "custom_string3_state"
    t.string "custom_string3_name"
    t.boolean "custom_int1_state"
    t.string "custom_int1_name"
    t.boolean "custom_int2_state"
    t.string "custom_int2_name"
    t.boolean "custom_int3_state"
    t.string "custom_int3_name"
    t.boolean "custom_txt1_state"
    t.text "custom_txt1_name"
    t.boolean "custom_txt2_state"
    t.text "custom_txt2_name"
    t.boolean "custom_txt3_state"
    t.text "custom_txt3_name"
    t.boolean "custom_date1_state"
    t.string "custom_date1_name"
    t.boolean "custom_date2_state"
    t.string "custom_date2_name"
    t.boolean "custom_date3_state"
    t.string "custom_date3_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "tags"
    t.bigint "collection_id", null: false
    t.string "custom_string1_value"
    t.string "custom_string2_value"
    t.string "custom_string3_value"
    t.integer "custom_int1_value"
    t.integer "custom_int2_value"
    t.integer "custom_int3_value"
    t.text "custom_txt1_value"
    t.text "custom_txt2_value"
    t.text "custom_txt3_value"
    t.date "custom_date1_value"
    t.date "custom_date2_value"
    t.date "custom_date3_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_items_on_collection_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.integer "status", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collections", "users"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "items", "collections"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
end
