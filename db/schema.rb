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

ActiveRecord::Schema.define(version: 20160206195534) do

  create_table "person", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "last_name",  limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "person", ["user_id"], name: "index_person_on_user_id", using: :btree

  create_table "scholarships", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "university_id",    limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description",      limit: 65535
    t.text     "requirements",     limit: 65535
    t.text     "benefits_offered", limit: 65535
    t.string   "url",              limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "scholarships", ["university_id"], name: "index_scholarships_on_university_id", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "city",        limit: 255
    t.string   "state",       limit: 255
    t.string   "country",     limit: 255
    t.text     "information", limit: 65535
    t.string   "url",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "type",                   limit: 255
    t.string   "user_name",              limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_work_materials", force: :cascade do |t|
    t.integer "work_material_id", limit: 4
    t.integer "candidate_id",     limit: 4
  end

  add_index "users_work_materials", ["work_material_id"], name: "index_users_work_materials_on_work_material_id", using: :btree

  create_table "work_materials", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.text     "description",             limit: 65535
    t.string   "file_src",                limit: 255
    t.integer  "tutor_id",                limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.datetime "attachment_updated_at"
  end

  add_foreign_key "person", "users"
  add_foreign_key "scholarships", "universities"
  add_foreign_key "users_work_materials", "work_materials"
end
