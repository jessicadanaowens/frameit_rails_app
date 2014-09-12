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

ActiveRecord::Schema.define(version: 20140912220725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frame_size_joins", force: true do |t|
    t.string   "frame_id"
    t.string   "frame_size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frame_sizes", force: true do |t|
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dimensions"
  end

  create_table "frames", force: true do |t|
    t.string   "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "length"
    t.integer  "width"
  end

  create_table "framesizejoins", force: true do |t|
    t.string   "frame_id"
    t.string   "frame_size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.string   "file_name",  default: "add description"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "height"
    t.integer  "width"
  end

  create_table "share_tables", force: true do |t|
    t.integer "user_id"
    t.integer "picture_id"
    t.string  "image"
  end

  create_table "shares", force: true do |t|
    t.integer "user_id"
    t.integer "picture_id"
  end

  create_table "user", force: true do |t|
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
  end

  create_table "users", force: true do |t|
    t.string  "email"
    t.string  "password_hash"
    t.string  "password_salt"
    t.string  "first_name"
    t.string  "last_name"
    t.boolean "guest"
  end

  create_table "walls", force: true do |t|
    t.string  "description"
    t.integer "height"
    t.integer "width"
    t.string  "image"
    t.integer "user_id"
  end

end
