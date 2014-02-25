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

ActiveRecord::Schema.define(:version => 20131217192847) do

  create_table "iresources", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "result_uri"
    t.string   "userid"
    t.string   "contextid"
    t.float    "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lti2_tp_registrations", :force => true do |t|
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
    t.string   "lti_version",                    :limit => 32
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "lti2_tp_registries", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lti2_tp_tools", :force => true do |t|
    t.string   "tool_name"
    t.text     "tool_profile_template"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "lti_registration_wips", :force => true do |t|
    t.string   "tenant_name"
    t.integer  "registration_id"
    t.string   "lti_version"
    t.text     "tool_consumer_profile"
    t.text     "tool_profile"
    t.string   "registration_return_url"
    t.string   "message_type"
    t.text     "tool_proxy"
    t.string   "state"
    t.integer  "result_status"
    t.string   "result_message"
    t.string   "support_email"
    t.string   "product_name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "tenant_users", :force => true do |t|
    t.integer  "tenant_id"
    t.string   "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tenants", :force => true do |t|
    t.string   "tenant_key"
    t.string   "secret"
    t.string   "tenant_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
