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

ActiveRecord::Schema.define(version: 20170326235818) do

  create_table "blocks", force: :cascade do |t|
    t.integer  "page_id"
    t.text     "components"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "priority"
  end

  create_table "columns", force: :cascade do |t|
    t.integer  "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "size"
    t.integer  "priority"
  end

  create_table "components", force: :cascade do |t|
    t.integer  "column_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "layout"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "title"
    t.string   "menu_id",    default: "0"
    t.integer  "priority"
    t.string   "urlname"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "companyname"
  end

  create_table "website_settings", force: :cascade do |t|
    t.string   "homepage_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
