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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131203170941) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "role"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mentor"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "courses", :force => true do |t|
    t.string   "course_label"
    t.string   "course_title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "admin_user_id"
    t.integer  "course_id"
    t.string   "role"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "grade_items", :force => true do |t|
    t.integer  "course_id"
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "grade_results", :force => true do |t|
    t.integer  "link_id"
    t.integer  "admin_user_id"
    t.float    "result"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "lti2_tc_deployment_requests", :force => true do |t|
    t.string   "reg_key"
    t.string   "reg_password"
    t.string   "partner_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "status"
    t.integer  "tool_id"
    t.string   "tc_profile_guid"
  end

  add_index "lti2_tc_deployment_requests", ["tc_profile_guid"], :name => "index_deployment_requests_on_tc_profile_guid", :unique => true

  create_table "lti2_tc_links", :force => true do |t|
    t.string   "resource_link_label"
    t.boolean  "is_enabled"
    t.integer  "grade_item_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "course_id"
    t.integer  "resource_id"
    t.string   "link_parameters"
    t.boolean  "is_name_permission"
    t.boolean  "is_email_permission"
  end

  create_table "lti2_tc_registries", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lti2_tc_resources", :force => true do |t|
    t.integer "tool_id"
    t.string  "resource_type"
    t.string  "name"
    t.string  "description"
  end

  create_table "lti2_tc_tool_consumer_profiles", :force => true do |t|
    t.string   "tc_profile_guid"
    t.text     "tc_profile"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "lti2_tc_tool_consumer_profiles", ["tc_profile_guid"], :name => "index_tool_consumer_profiles_on_tc_profile_guid", :unique => true

  create_table "lti2_tc_tool_settings", :force => true do |t|
    t.integer "tool_id"
    t.integer "scopeable_id"
    t.string  "scopeable_type"
    t.string  "name"
    t.string  "value"
  end

  create_table "lti2_tc_tools", :force => true do |t|
    t.text     "tool_proxy"
    t.boolean  "is_enabled"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "product_name"
    t.string   "description"
    t.string   "key"
    t.string   "secret"
  end

  add_index "lti2_tc_tools", ["key"], :name => "index_tools_on_key", :unique => true

end
