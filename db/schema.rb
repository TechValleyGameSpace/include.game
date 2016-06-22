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

ActiveRecord::Schema.define(version: 20160621031234) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.binary   "header_image"
    t.binary   "icon_image"
    t.date     "start"
    t.date     "end"
    t.date     "submission_grace_period"
    t.boolean  "submission_open"
    t.integer  "status"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "events", ["name"], name: "index_events_on_name"
  add_index "events", ["start"], name: "index_events_on_start"

  create_table "submissions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.binary   "header_image"
    t.binary   "icon_image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "event_id"
  end

  add_index "submissions", ["event_id"], name: "index_submissions_on_event_id"

  create_table "team_role_in_submissions", force: :cascade do |t|
    t.text     "role"
    t.integer  "team_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "team_role_in_submissions", ["submission_id"], name: "index_team_role_in_submissions_on_submission_id"
  add_index "team_role_in_submissions", ["team_id"], name: "index_team_role_in_submissions_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.binary   "team_image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_role_in_events", force: :cascade do |t|
    t.text     "message"
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_role_in_events", ["event_id"], name: "index_user_role_in_events_on_event_id"
  add_index "user_role_in_events", ["user_id"], name: "index_user_role_in_events_on_user_id"

  create_table "user_role_in_submissions", force: :cascade do |t|
    t.text     "role"
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_role_in_submissions", ["submission_id"], name: "index_user_role_in_submissions_on_submission_id"
  add_index "user_role_in_submissions", ["user_id"], name: "index_user_role_in_submissions_on_user_id"

  create_table "user_role_in_teams", force: :cascade do |t|
    t.text     "role"
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_role_in_teams", ["team_id"], name: "index_user_role_in_teams_on_team_id"
  add_index "user_role_in_teams", ["user_id"], name: "index_user_role_in_teams_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "realname"
    t.text     "description"
    t.binary   "profile_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["username"], name: "index_users_on_username"

end
