class CreateLti2ToolConsumerTables < ActiveRecord::Migration
  def up
    create_table :lti2_tc_deployment_requests do |t|
      t.string   :reg_key
      t.string   :reg_password
      t.string   :partner_url
      t.string   :status
      t.string   :disposition
      t.string   :end_registration_id
      t.string   :tc_profile_guid
      t.text     :tool_proxy_json

      t.timestamps
    end
    add_index :lti2_tc_deployment_requests, [:tc_profile_guid], :name => :index_deployment_requests_on_tc_profile_guid, :unique => true
    execute('ALTER TABLE lti2_tc_deployment_requests CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tc_deployment_requests MODIFY `reg_key` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_deployment_requests MODIFY `reg_password` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_deployment_requests MODIFY `partner_url` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_deployment_requests MODIFY `status` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_deployment_requests MODIFY `disposition` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_deployment_requests MODIFY `tc_profile_guid` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_deployment_requests MODIFY `end_registration_id` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_deployment_requests MODIFY `tool_proxy_json` TEXT CHARACTER SET utf8mb4 NULL;")

    create_table :lti2_tc_registries do |t|
      t.string   :name
      t.text     :content

      t.timestamps
    end
    execute('ALTER TABLE lti2_tc_registries CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tc_registries MODIFY `name` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_registries MODIFY `content` TEXT CHARACTER SET utf8mb4 NULL;")

    create_table :lti2_tc_tool_consumer_profiles do |t|
        t.string   :tc_profile_guid
        t.text     :tc_profile

        t.timestamps
      end
    add_index :lti2_tc_tool_consumer_profiles, [:tc_profile_guid], :name => :index_tool_consumer_profiles_on_tc_profile_guid, :unique => true
    execute('ALTER TABLE lti2_tc_tool_consumer_profiles CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tc_tool_consumer_profiles MODIFY `tc_profile_guid` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_tool_consumer_profiles MODIFY `tc_profile` TEXT CHARACTER SET utf8mb4 NULL;")

    create_table :lti2_tc_tool_settings do |t|
      t.integer :tool_id
      t.integer :scopeable_id
      t.string  :scopeable_type
      t.string  :name
      t.string  :value

      t.timestamps
    end
    execute('ALTER TABLE lti2_tc_tool_settings CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tc_tool_settings MODIFY `scopeable_type` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_tool_settings MODIFY `name` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_tool_settings MODIFY `value` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")

    create_table :lti2_tc_tools do |t|
      t.text     :tool_proxy
      t.boolean  :is_enabled
      t.string   :product_name
      t.string   :description
      t.string   :key
      t.string   :secret
      t.string   :status
      t.integer  :new_deployment_request_id
      t.string   :end_registration_id
      t.string   :registration_return_url

      t.timestamps
    end
    add_index :lti2_tc_tools, [:key], :name => :index_tools_on_key, :unique => true
    execute('ALTER TABLE lti2_tc_tools CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tc_tools MODIFY `tool_proxy` TEXT CHARACTER SET utf8mb4 NULL;")
    execute("ALTER TABLE lti2_tc_tools MODIFY `product_name` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_tools MODIFY `description` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_tools MODIFY `key` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_tools MODIFY `secret` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_tools MODIFY `status` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_tools MODIFY `registration_return_url` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_tools MODIFY `end_registration_id` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
  end

  def down
    drop_table :lti2_tc_deployment_requests
    drop_table :lti2_tc_registries
    drop_table :lti2_tc_tool_consumer_profiles
    drop_table :lti2_tc_tool_settings
    drop_table :lti2_tc_tools
  end
end
