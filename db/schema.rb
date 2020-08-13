# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_11_194049) do

  create_table "directions", force: :cascade do |t|
    t.text "step"
    t.integer "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recipes_id"
    t.index ["recipe_id"], name: "index_directions_on_recipe_id"
    t.index ["recipes_id"], name: "index_directions_on_recipes_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recipes_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
    t.index ["recipes_id"], name: "index_ingredients_on_recipes_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "{:foreign_key=>true}_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["{:foreign_key=>true}_id"], name: "index_recipes_on_{:foreign_key=>true}_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "directions", "recipes"
  add_foreign_key "directions", "recipes", column: "recipes_id"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "ingredients", "recipes", column: "recipes_id"
end
