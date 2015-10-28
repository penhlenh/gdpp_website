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

ActiveRecord::Schema.define(version: 20151028033944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "announcement_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "announcement_type_id"
    t.integer  "procurement_entity_id"
    t.integer  "budget_source_id"
    t.date     "open_register_date"
    t.date     "close_submit_date"
    t.date     "open_bid_doc_date"
    t.boolean  "public"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "announcements", ["announcement_type_id"], name: "index_announcements_on_announcement_type_id", using: :btree
  add_index "announcements", ["budget_source_id"], name: "index_announcements_on_budget_source_id", using: :btree
  add_index "announcements", ["procurement_entity_id"], name: "index_announcements_on_procurement_entity_id", using: :btree

  create_table "budget_sources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "law_regulations", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "thumbnail"
    t.string   "law_doc_attachment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "procurement_entities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "announcements", "announcement_types"
  add_foreign_key "announcements", "budget_sources"
  add_foreign_key "announcements", "procurement_entities"
end
