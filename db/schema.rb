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

ActiveRecord::Schema.define(version: 20160301235808) do

  create_table "commontator_comments", force: :cascade do |t|
    t.string   "creator_type",      limit: 255
    t.integer  "creator_id",        limit: 4
    t.string   "editor_type",       limit: 255
    t.integer  "editor_id",         limit: 4
    t.integer  "thread_id",         limit: 4,                 null: false
    t.text     "body",              limit: 65535,             null: false
    t.datetime "deleted_at"
    t.integer  "cached_votes_up",   limit: 4,     default: 0
    t.integer  "cached_votes_down", limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_comments", ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down", using: :btree
  add_index "commontator_comments", ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up", using: :btree
  add_index "commontator_comments", ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id", using: :btree
  add_index "commontator_comments", ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at", using: :btree

  create_table "commontator_subscriptions", force: :cascade do |t|
    t.string   "subscriber_type", limit: 255, null: false
    t.integer  "subscriber_id",   limit: 4,   null: false
    t.integer  "thread_id",       limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_subscriptions", ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true, using: :btree
  add_index "commontator_subscriptions", ["thread_id"], name: "index_commontator_subscriptions_on_thread_id", using: :btree

  create_table "commontator_threads", force: :cascade do |t|
    t.string   "commontable_type", limit: 255
    t.integer  "commontable_id",   limit: 4
    t.datetime "closed_at"
    t.string   "closer_type",      limit: 255
    t.integer  "closer_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_threads", ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true, using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "last_name",        limit: 255
    t.string   "university",       limit: 255
    t.string   "area_of_interest", limit: 255
    t.string   "comments",         limit: 255
    t.string   "first_choice",     limit: 255
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

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

  create_table "selection_processes", force: :cascade do |t|
    t.string   "university_name", limit: 255
    t.date     "deadline"
    t.text     "activities",      limit: 65535
    t.string   "link",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

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
    t.string   "email",                      limit: 255, default: "",   null: false
    t.string   "encrypted_password",         limit: 255, default: "",   null: false
    t.string   "type",                       limit: 255
    t.string   "user_name",                  limit: 255
    t.string   "reset_password_token",       limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",         limit: 255
    t.string   "last_sign_in_ip",            limit: 255
    t.string   "confirmation_token",         limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",          limit: 255
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "tutor_id",                   limit: 4
    t.string   "image_profile_file_name",    limit: 255
    t.string   "image_profile_content_type", limit: 255
    t.integer  "image_profile_file_size",    limit: 4
    t.datetime "image_profile_updated_at"
    t.boolean  "pending",                                default: true
    t.date     "requested_date"
    t.integer  "requested_scholarship_id",   limit: 4
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_work_materials", force: :cascade do |t|
    t.integer "work_material_id", limit: 4
    t.integer "candidate_id",     limit: 4
    t.boolean "done",                           default: false
    t.integer "progress",         limit: 4,     default: 0
    t.text    "comment",          limit: 65535
  end

  add_index "users_work_materials", ["work_material_id"], name: "index_users_work_materials_on_work_material_id", using: :btree

  create_table "work_materials", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.text     "description",             limit: 65535
    t.integer  "tutor_id",                limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.datetime "attachment_updated_at"
  end

  add_foreign_key "people", "users"
  add_foreign_key "scholarships", "universities"
  add_foreign_key "users_work_materials", "work_materials"
end
