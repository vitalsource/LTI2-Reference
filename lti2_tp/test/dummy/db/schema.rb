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

  create_table "lti2_tp_contexts", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tp_deployment_proposals", force: true do |t|
    t.string   "tenant_key"
    t.string   "tenant_name"
    t.string   "user_id"
    t.string   "reg_key"
    t.string   "reg_password"
    t.string   "tc_profile_url"
    t.string   "launch_presentation_return_url"
    t.string   "status"
    t.string   "message_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tp_registries", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lti2_tp_tool_deployments", force: true do |t|
    t.integer  "tenant_id"
    t.integer  "tool_id"
    t.string   "product_name"
    t.text     "tool_proxy"
    t.string   "key"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lti2_tp_tool_deployments", ["key"], name: "index_tool_deployments_on_key", unique: true

  create_table "lti2_tp_tools", force: true do |t|
    t.string   "tool_name"
    t.text     "tool_profile_template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
