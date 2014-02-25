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

ActiveRecord::Schema.define(version: 20131121012233) do

  create_table "lti2_tc_deployment_requests", force: true do |t|
    t.string   "reg_key"
    t.string   "reg_password"
    t.string   "partner_url"
    t.string   "status"
    t.integer  "tool_id"
    t.string   "tc_profile_guid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lti2_tc_deployment_requests", ["tc_profile_guid"], name: "index_deployment_requests_on_tc_profile_guid", unique: true, using: :btree

  create_table "lti2_tc_registries", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tc_tool_consumer_profiles", force: true do |t|
    t.string   "tc_profile_guid"
    t.text     "tc_profile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lti2_tc_tool_consumer_profiles", ["tc_profile_guid"], name: "index_tool_consumer_profiles_on_tc_profile_guid", unique: true, using: :btree

  create_table "lti2_tc_tool_settings", force: true do |t|
    t.integer  "tool_id"
    t.integer  "scopeable_id"
    t.string   "scopeable_type"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tc_tools", force: true do |t|
    t.text     "tool_proxy"
    t.boolean  "is_enabled"
    t.string   "product_name"
    t.string   "description"
    t.string   "key"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lti2_tc_tools", ["key"], name: "index_tools_on_key", unique: true, using: :btree

end
