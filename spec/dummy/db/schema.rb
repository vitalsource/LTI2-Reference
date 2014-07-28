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

ActiveRecord::Schema.define(version: 20140728170807) do

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

  add_index "lti2_tc_deployment_requests", ["tc_profile_guid"], name: "index_deployment_requests_on_tc_profile_guid", unique: true

  create_table "lti2_tc_links", force: true do |t|
    t.string   "resource_link_label"
    t.boolean  "is_enabled"
    t.integer  "grade_item_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "course_id"
    t.integer  "resource_id"
    t.string   "link_parameters"
    t.boolean  "is_name_permission"
    t.boolean  "is_email_permissions"
  end

  create_table "lti2_tc_registries", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tc_resources", force: true do |t|
    t.integer "tool_id"
    t.string  "resource_type"
    t.string  "name"
    t.string  "description"
  end

  create_table "lti2_tc_tool_consumer_profiles", force: true do |t|
    t.string   "tc_profile_guid"
    t.text     "tc_profile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lti2_tc_tool_consumer_profiles", ["tc_profile_guid"], name: "index_tool_consumer_profiles_on_tc_profile_guid", unique: true

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

  add_index "lti2_tc_tools", ["key"], name: "index_tools_on_key", unique: true

  create_table "lti2_tp_registrations", force: true do |t|
    t.string   "tenant_key"
    t.string   "tenant_name"
    t.integer  "tenant_id"
    t.string   "user_id"
    t.string   "reg_key"
    t.string   "reg_password"
    t.string   "tc_profile_url"
    t.string   "launch_presentation_return_url"
    t.string   "status"
    t.string   "message_type"
    t.text     "tool_consumer_profile_json"
    t.text     "tool_profile_json"
    t.text     "tool_proxy_json"
    t.integer  "tool_id"
    t.string   "lti_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tp_registries", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tp_tools", force: true do |t|
    t.string   "tool_name"
    t.text     "tool_profile_template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
