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

ActiveRecord::Schema.define(version: 20141215150133) do

  create_table "lti2_tc_deployment_requests", force: true do |t|
    t.string   "reg_key",             limit: 191
    t.string   "reg_password",        limit: 191
    t.string   "partner_url",         limit: 191
    t.string   "status",              limit: 191
    t.string   "disposition",         limit: 191
    t.string   "end_registration_id", limit: 191
    t.string   "tc_profile_guid",     limit: 191
    t.string   "tool_proxy_guid"
    t.text     "tool_proxy_json"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tc_links", force: true do |t|
    t.string   "resource_link_label",  limit: 191
    t.boolean  "is_enabled"
    t.integer  "grade_item_id"
    t.integer  "course_id"
    t.integer  "resource_id"
    t.string   "link_parameters",      limit: 191
    t.boolean  "is_name_permission"
    t.boolean  "is_email_permissions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tc_registries", force: true do |t|
    t.string   "name",       limit: 191
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tc_resources", force: true do |t|
    t.integer  "tool_id"
    t.string   "resource_type", limit: 191
    t.string   "resource_name", limit: 191
    t.string   "description",   limit: 191
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tc_tool_consumer_profiles", force: true do |t|
    t.string   "tc_profile_guid", limit: 191
    t.text     "tc_profile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tc_tool_settings", force: true do |t|
    t.integer  "tool_id"
    t.integer  "scopeable_id"
    t.string   "scopeable_type", limit: 191
    t.string   "name",           limit: 191
    t.string   "value",          limit: 191
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tc_tools", force: true do |t|
    t.text     "tool_proxy"
    t.boolean  "is_enabled"
    t.string   "product_name",              limit: 191
    t.string   "description",               limit: 191
    t.string   "key",                       limit: 191
    t.string   "secret",                    limit: 191
    t.string   "status",                    limit: 191
    t.integer  "new_deployment_request_id"
    t.string   "end_registration_id",       limit: 191
    t.string   "registration_return_url",   limit: 191
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tp_registrations", force: true do |t|
    t.integer  "tool_id"
    t.integer  "tenant_id"
    t.string   "tenant_name",                    limit: 191
    t.string   "tenant_basename",                limit: 191
    t.string   "user_id",                        limit: 191
    t.string   "reg_key",                        limit: 191
    t.string   "reg_password",                   limit: 191
    t.string   "tc_profile_url",                 limit: 191
    t.string   "launch_presentation_return_url", limit: 191
    t.string   "status",                         limit: 191
    t.string   "message_type",                   limit: 191
    t.string   "lti_version",                    limit: 191
    t.string   "end_registration_id",            limit: 191
    t.text     "tool_consumer_profile_json"
    t.text     "tool_profile_json"
    t.text     "tool_proxy_json"
    t.text     "proposed_tool_proxy_json"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tp_registries", force: true do |t|
    t.string   "name",       limit: 191
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tp_tools", force: true do |t|
    t.string   "tool_name",             limit: 191
    t.text     "tool_profile_template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
