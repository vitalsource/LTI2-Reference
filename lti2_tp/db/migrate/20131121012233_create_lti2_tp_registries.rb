class CreateLti2TpRegistries < ActiveRecord::Migration
  def change
    create_table :lti2_tp_deployment_proposals do |t|
      t.string   "tenant_key"
      t.string   "tenant_name"
      t.string   "user_id"
      t.string   "reg_key"
      t.string   "reg_password"
      t.string   "tc_profile_url"
      t.string   "launch_presentation_return_url"
      t.string   "status"
      t.string   "message_type"

      t.timestamps
    end

    create_table "lti2_tp_contexts", :force => true do |t|
      t.text     "content"

      t.timestamps
    end

    create_table "lti2_tp_registries", :force => true do |t|
      t.string   "name"
      t.text     "content"

      t.timestamps
    end

    create_table "lti2_tp_tool_deployments", :force => true do |t|
      t.integer  "tenant_id"
      t.integer  "tool_id"
      t.string   "product_name"
      t.text     "tool_proxy"
      t.string   "key"
      t.string   "secret"

      t.timestamps
    end
    add_index "lti2_tp_tool_deployments", ["key"], :name => "index_tool_deployments_on_key", :unique => true

    create_table "lti2_tp_tools", :force => true do |t|
      t.string   "tool_name"
      t.text     "tool_profile_template"

      t.timestamps
    end
  end
end
