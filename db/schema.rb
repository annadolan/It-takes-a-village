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

ActiveRecord::Schema.define(version: 20170110183621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_categories", force: :cascade do |t|
    t.integer "category_id"
    t.integer "event_id"
    t.index ["category_id"], name: "index_events_categories_on_category_id", using: :btree
    t.index ["event_id"], name: "index_events_categories_on_event_id", using: :btree
  end

  create_table "events_tasks", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_events_tasks_on_event_id", using: :btree
    t.index ["task_id"], name: "index_events_tasks_on_task_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_tasks_on_category_id", using: :btree
  end

  create_table "user_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id", using: :btree
    t.index ["role_id"], name: "index_user_events_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_events_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_number"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "unit_number"
    t.string   "phone"
    t.string   "password_digest"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.string   "verification_code"
  end

  create_table "users_tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "date"
    t.string   "time"
    t.index ["task_id"], name: "index_users_tasks_on_task_id", using: :btree
    t.index ["user_id"], name: "index_users_tasks_on_user_id", using: :btree
  end

  add_foreign_key "events_categories", "categories"
  add_foreign_key "events_categories", "events"
  add_foreign_key "events_tasks", "events"
  add_foreign_key "events_tasks", "tasks"
  add_foreign_key "tasks", "categories"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "roles"
  add_foreign_key "user_events", "users"
end
