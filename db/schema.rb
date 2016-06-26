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

ActiveRecord::Schema.define(version: 20160621023957) do

  create_table "events", force: :cascade do |t|
    t.string   "name",                         null: false
    t.datetime "start",                        null: false
    t.datetime "end",                          null: false
    t.string   "name_of_location"
    t.string   "address"
    t.float    "latitude",                     null: false
    t.float    "longitude",                    null: false
    t.text     "description"
    t.integer  "status",           default: 0, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "events", ["address"], name: "index_events_on_address"
  add_index "events", ["end"], name: "index_events_on_end"
  add_index "events", ["latitude"], name: "index_events_on_latitude"
  add_index "events", ["longitude"], name: "index_events_on_longitude"
  add_index "events", ["name", "start", "latitude", "longitude"], name: "index_events_on_name_and_start_and_latitude_and_longitude", unique: true
  add_index "events", ["name"], name: "index_events_on_name"
  add_index "events", ["start"], name: "index_events_on_start"
  add_index "events", ["status"], name: "index_events_on_status"

  create_table "submissions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status",      default: 0, null: false
    t.integer  "event_id",                null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "submissions", ["event_id"], name: "index_submissions_on_event_id"
  add_index "submissions", ["name", "event_id"], name: "index_submissions_on_name_and_event_id", unique: true
  add_index "submissions", ["name"], name: "index_submissions_on_name"
  add_index "submissions", ["status"], name: "index_submissions_on_status"

  create_table "team_role_in_submissions", force: :cascade do |t|
    t.text     "role"
    t.integer  "team_id",       null: false
    t.integer  "submission_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "team_role_in_submissions", ["submission_id"], name: "index_team_role_in_submissions_on_submission_id"
  add_index "team_role_in_submissions", ["team_id", "submission_id"], name: "index_team_role_in_submissions_on_team_id_and_submission_id", unique: true
  add_index "team_role_in_submissions", ["team_id"], name: "index_team_role_in_submissions_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status",      default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "teams", ["name"], name: "index_teams_on_name"
  add_index "teams", ["status"], name: "index_teams_on_status"

  create_table "user_role_in_events", force: :cascade do |t|
    t.text     "message"
    t.integer  "status",     default: 0, null: false
    t.integer  "user_id",                null: false
    t.integer  "event_id",               null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_role_in_events", ["event_id"], name: "index_user_role_in_events_on_event_id"
  add_index "user_role_in_events", ["status"], name: "index_user_role_in_events_on_status"
  add_index "user_role_in_events", ["user_id", "event_id"], name: "index_user_role_in_events_on_user_id_and_event_id", unique: true
  add_index "user_role_in_events", ["user_id"], name: "index_user_role_in_events_on_user_id"

  create_table "user_role_in_submissions", force: :cascade do |t|
    t.text     "role"
    t.integer  "status",        default: 0, null: false
    t.integer  "user_id",                   null: false
    t.integer  "submission_id",             null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_role_in_submissions", ["status"], name: "index_user_role_in_submissions_on_status"
  add_index "user_role_in_submissions", ["submission_id"], name: "index_user_role_in_submissions_on_submission_id"
  add_index "user_role_in_submissions", ["user_id", "submission_id"], name: "index_user_role_in_submissions_on_user_id_and_submission_id", unique: true
  add_index "user_role_in_submissions", ["user_id"], name: "index_user_role_in_submissions_on_user_id"

  create_table "user_role_in_teams", force: :cascade do |t|
    t.text     "role"
    t.integer  "status"
    t.integer  "user_id",    null: false
    t.integer  "team_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_role_in_teams", ["team_id"], name: "index_user_role_in_teams_on_team_id"
  add_index "user_role_in_teams", ["user_id", "team_id"], name: "index_user_role_in_teams_on_user_id_and_team_id", unique: true
  add_index "user_role_in_teams", ["user_id"], name: "index_user_role_in_teams_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",                    null: false
    t.string   "email",                       null: false
    t.string   "password_digest",             null: false
    t.string   "real_name"
    t.text     "description"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "status",          default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["address"], name: "index_users_on_address"
  add_index "users", ["latitude"], name: "index_users_on_latitude"
  add_index "users", ["longitude"], name: "index_users_on_longitude"
  add_index "users", ["real_name"], name: "index_users_on_real_name"
  add_index "users", ["status"], name: "index_users_on_status"
  add_index "users", ["username"], name: "index_users_on_username"

end
