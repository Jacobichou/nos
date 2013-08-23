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

ActiveRecord::Schema.define(version: 20130822171921) do

  create_table "departments", force: true do |t|
    t.string   "dept_name"
    t.string   "dept_director"
    t.integer  "staff_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_summary_forms", force: true do |t|
    t.integer  "user_id"
    t.string   "project_manager"
    t.string   "location"
    t.integer  "budget"
    t.integer  "est_revenue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",               default: "A PSF"
    t.integer  "hierarchy_lvl",       default: 1
    t.boolean  "approved",            default: false
    t.boolean  "reviewed",            default: false
    t.time     "start_time"
    t.time     "end_time"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "frequency"
    t.string   "frequency_exception"
    t.string   "purpose"
    t.string   "audience"
    t.string   "outcome"
    t.integer  "fee"
    t.boolean  "offering"
    t.integer  "event_level"
    t.string   "request_type"
    t.string   "comments"
    t.integer  "revenue"
    t.string   "objectives",          default: "n/a"
    t.string   "facilities",          default: "n/a"
    t.string   "comm",                default: "n/a"
    t.string   "worship_council",     default: "n/a"
    t.string   "day_staff",           default: "n/a"
    t.string   "menu",                default: "n/a"
    t.string   "greeters",            default: "n/a"
    t.string   "ushers",              default: "n/a"
    t.string   "decorations",         default: "n/a"
    t.string   "num_participants"
    t.string   "additional_requests", default: "n/a"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hierarchy",              default: 4
    t.string   "phone"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
