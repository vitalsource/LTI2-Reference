# This migration comes from lti2_tp (originally 20131121012233)
class CreateLti2TpRegistries < ActiveRecord::Migration
  def change
    create_table :lti2_tp_registrations do |t|
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

      t.timestamps
    end

    create_table "lti2_tp_registries", :force => true do |t|
      t.string   "name"
      t.text     "content"

      t.timestamps
    end

    create_table "lti2_tp_tools", :force => true do |t|
      t.string   "tool_name"
      t.text     "tool_profile_template"

      t.timestamps
    end
  end
end
