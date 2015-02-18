# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150218000501) do

  create_table "dormitories", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "menu_type",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dormitories", ["name"], name: "index_dormitories_on_name", unique: true

  create_table "menes", force: :cascade do |t|
    t.string   "menu_type",   null: false
    t.string   "breakfast_j"
    t.string   "breakfast_w"
    t.string   "dinner"
    t.date     "open_day",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "menes", ["menu_type"], name: "index_menes_on_menu_type"
  add_index "menes", ["open_day"], name: "index_menes_on_open_day"

  create_table "menus", force: :cascade do |t|
    t.string   "menu_type",   null: false
    t.string   "breakfast_j"
    t.string   "breakfast_w"
    t.string   "dinner"
    t.date     "open_day"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "menus", ["menu_type", "open_day"], name: "index_menus_on_menu_type_and_open_day", unique: true
  add_index "menus", ["menu_type"], name: "index_menus_on_menu_type"
  add_index "menus", ["open_day"], name: "index_menus_on_open_day"

  create_table "users", force: :cascade do |t|
    t.string   "provider",     null: false
    t.string   "uid",          null: false
    t.string   "nickname",     null: false
    t.string   "image_url",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "dormitory_id"
  end

  add_index "users", ["dormitory_id"], name: "index_users_on_dormitory_id"
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true

end
