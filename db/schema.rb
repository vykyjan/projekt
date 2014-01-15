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

ActiveRecord::Schema.define(version: 20140114105745) do

  create_table "bride_galleries", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "cover"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bride_pictures", force: true do |t|
    t.string   "description"
    t.string   "image"
    t.integer  "bride_gallery_id"
    t.string   "gallery_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "cover"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "token"
  end

  create_table "groom_galleries", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  create_table "groom_pictures", force: true do |t|
    t.string   "description"
    t.string   "image"
    t.integer  "groom_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gallery_token"
  end

  create_table "pictures", force: true do |t|
    t.string   "description"
    t.string   "image"
    t.integer  "gallery_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "gallery_token"
  end

  create_table "presents", force: true do |t|
    t.string   "name"
    t.string   "pole"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "text"
    t.boolean  "boolean",    default: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.integer  "person"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
