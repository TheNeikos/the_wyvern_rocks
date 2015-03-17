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

ActiveRecord::Schema.define(version: 20150317043100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_posts", force: :cascade do |t|
    t.integer  "blog_id"
    t.string   "name"
    t.string   "content"
    t.boolean  "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "member_id"
  end

  add_index "blog_posts", ["blog_id"], name: "index_blog_posts_on_blog_id", using: :btree
  add_index "blog_posts", ["member_id"], name: "index_blog_posts_on_member_id", using: :btree

  create_table "blogs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "member_id"
  end

  add_index "blogs", ["member_id"], name: "index_blogs_on_member_id", using: :btree

  create_table "dashboard_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forums", force: :cascade do |t|
    t.string   "name"
    t.string   "order"
    t.integer  "dashboard_category_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "global_settings", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.string   "description"
    t.integer  "setting_type", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["member_id"], name: "index_identities_on_member_id", using: :btree

  create_table "members", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.boolean  "is_admin"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "content"
    t.integer  "topic_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "member_id"
  end

  add_index "posts", ["member_id"], name: "index_posts_on_member_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "forum_id"
    t.string   "content"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.datetime "last_post_created_at", default: '2015-03-14 20:58:26'
    t.integer  "member_id"
  end

  add_index "topics", ["member_id"], name: "index_topics_on_member_id", using: :btree

  add_foreign_key "blog_posts", "blogs"
  add_foreign_key "blog_posts", "members"
  add_foreign_key "blogs", "members"
  add_foreign_key "identities", "members"
  add_foreign_key "posts", "members"
  add_foreign_key "topics", "members"
end
