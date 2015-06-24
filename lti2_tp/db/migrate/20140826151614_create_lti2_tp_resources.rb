class CreateLti2TpResources < ActiveRecord::Migration
  def up
    create_table :lti2_tp_registrations do |t|
      t.integer  :tenant_id
      t.string   :tenant_name
      t.string   :tenant_basename
      t.string   :user_id
      t.string   :reg_key
      t.string   :reg_password
      t.text     :final_secret
      t.string   :tc_profile_url
      t.string   :launch_presentation_return_url
      t.string   :status
      t.string   :message_type
      t.string   :lti_version
      t.string   :end_registration_id
      t.integer  :tool_id
      t.text     :tool_consumer_profile_json
      t.text     :tool_profile_json
      t.text     :tool_proxy_json
      t.text     :proposed_tool_proxy_json
      t.text     :tool_proxy_response

      t.timestamps
    end
    execute('ALTER TABLE lti2_tp_registrations CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tp_registrations MODIFY `tenant_name` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `tenant_basename` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `user_id` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `reg_key` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `reg_password` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `final_secret` TEXT CHARACTER SET utf8mb4 NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `tc_profile_url` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `launch_presentation_return_url` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `status` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `message_type` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `lti_version` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `end_registration_id` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `tool_consumer_profile_json` TEXT CHARACTER SET utf8mb4 NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `tool_profile_json` TEXT CHARACTER SET utf8mb4 NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `tool_proxy_json` TEXT CHARACTER SET utf8mb4 NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `tool_proxy_response` TEXT CHARACTER SET utf8mb4 NULL;")
    execute("ALTER TABLE lti2_tp_registrations MODIFY `proposed_tool_proxy_json` TEXT CHARACTER SET utf8mb4 NULL;")

    create_table :lti2_tp_registries do |t|
      t.string   :name
      t.text     :content

      t.timestamps
    end
    execute('ALTER TABLE lti2_tp_registries CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tp_registries MODIFY `name` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_registries MODIFY `content` TEXT CHARACTER SET utf8mb4 NULL;")

    create_table :lti2_tp_tools do |t|
      t.string   :tool_name
      t.text     :tool_profile_template

      t.timestamps
    end
    execute('ALTER TABLE lti2_tp_tools CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tp_tools MODIFY `tool_name` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tp_tools MODIFY `tool_profile_template` TEXT CHARACTER SET utf8mb4 NULL;")
  end

  def down
    drop_table :lti2_tp_registrations
    drop_table :lti2_tp_registries
    drop_table :lti2_tp_tools
  end
end
