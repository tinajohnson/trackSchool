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

ActiveRecord::Schema.define(version: 20160725155920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "allotments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "school_id"
    t.integer "class_mapping_id"
    t.string  "role"
  end

  add_index "allotments", ["class_mapping_id"], name: "index_allotments_on_class_mapping_id", using: :btree
  add_index "allotments", ["school_id"], name: "index_allotments_on_school_id", using: :btree
  add_index "allotments", ["user_id"], name: "index_allotments_on_user_id", using: :btree

  create_table "attendances", force: :cascade do |t|
    t.string   "student_id"
    t.string   "integer"
    t.string   "attendance"
    t.date     "Date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_mappings", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "standard_id"
    t.integer  "section_id"
    t.integer  "school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "school_name"
    t.string   "school_location"
    t.string   "school_contact"
    t.string   "school_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "section_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "standards", force: :cascade do |t|
    t.string   "standard_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "class_mapping_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "role"
    t.integer  "school_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "allotments", "class_mappings"
  add_foreign_key "allotments", "schools"
  add_foreign_key "allotments", "users"
  add_foreign_key "class_mappings", "schools"
  add_foreign_key "class_mappings", "sections"
  add_foreign_key "class_mappings", "standards"
  add_foreign_key "students", "class_mappings"
  add_foreign_key "users", "schools"
end
