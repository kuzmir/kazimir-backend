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

ActiveRecord::Schema.define(version: 20150428212215) do

  create_table "pages", force: :cascade do |t|
    t.string   "title_en",        limit: 255
    t.string   "title_pl",        limit: 255
    t.string   "subtitle_en",     limit: 255
    t.string   "subtitle_pl",     limit: 255
    t.string   "description_en",  limit: 255
    t.string   "description_pl",  limit: 255
    t.text     "introduction_en", limit: 65535
    t.text     "introduction_pl", limit: 65535
    t.text     "content_en",      limit: 65535
    t.text     "content_pl",      limit: 65535
    t.text     "aside_en",        limit: 65535
    t.text     "aside_pl",        limit: 65535
    t.text     "footnotes_en",    limit: 65535
    t.text     "footnotes_pl",    limit: 65535
    t.string   "slug_en",         limit: 255
    t.string   "slug_pl",         limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "pages", ["slug_en"], name: "index_pages_on_slug_en", unique: true, using: :btree
  add_index "pages", ["slug_pl"], name: "index_pages_on_slug_pl", unique: true, using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535
    t.string   "place_type",  limit: 255,   null: false
    t.integer  "street_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streets", force: :cascade do |t|
    t.string   "name",             limit: 255,                   null: false
    t.text     "description",      limit: 65535,                 null: false
    t.text     "past_description", limit: 65535,                 null: false
    t.boolean  "active",           limit: 1,     default: false, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.text     "path",             limit: 65535
  end

end
