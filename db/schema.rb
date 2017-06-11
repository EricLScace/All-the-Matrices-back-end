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

ActiveRecord::Schema.define(version: 20170611001045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id", using: :btree
  end

  create_table "faces", force: :cascade do |t|
    t.text     "face"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fonts", force: :cascade do |t|
    t.text     "font"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.text     "name"
    t.text     "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matrices", force: :cascade do |t|
    t.integer  "manufacturer_id"
    t.decimal  "code_prefix",     precision: 6, scale: 2
    t.integer  "code_suffix"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["manufacturer_id"], name: "index_matrices_on_manufacturer_id", using: :btree
  end

  create_table "optical_sizes", force: :cascade do |t|
    t.decimal  "points",     precision: 6, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "orientations", force: :cascade do |t|
    t.text     "orientation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "typefaces", force: :cascade do |t|
    t.integer  "optical_size_id"
    t.integer  "font_id"
    t.integer  "face_id",         default: 0
    t.integer  "weight_id",       default: 0
    t.integer  "width_id",        default: 0
    t.integer  "orientation_id",  default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["face_id"], name: "index_typefaces_on_face_id", using: :btree
    t.index ["font_id"], name: "index_typefaces_on_font_id", using: :btree
    t.index ["optical_size_id"], name: "index_typefaces_on_optical_size_id", using: :btree
    t.index ["orientation_id"], name: "index_typefaces_on_orientation_id", using: :btree
    t.index ["weight_id"], name: "index_typefaces_on_weight_id", using: :btree
    t.index ["width_id"], name: "index_typefaces_on_width_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "name"
    t.text     "organization"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  create_table "weights", force: :cascade do |t|
    t.text     "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "widths", force: :cascade do |t|
    t.text     "width"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "examples", "users"
end
