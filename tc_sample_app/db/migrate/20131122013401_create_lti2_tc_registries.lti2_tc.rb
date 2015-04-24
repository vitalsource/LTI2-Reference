class CreateLti2TcRegistries < ActiveRecord::Migration
  def change
    create_table :lti2_tc_deployment_requests do |t|
      t.string   :reg_key
      t.string   :reg_password
      t.string   :partner_url
      t.string   :status
      t.string   :tc_profile_guid
      t.text     :tool_proxy_json
      t.integer  :end_registration_id

      t.timestamps
    end
    add_index :lti2_tc_deployment_requests, [:tc_profile_guid], :name => :index_deployment_requests_on_tc_profile_guid, :unique => true

    create_table :lti2_tc_registries do |t|
      t.string   :name
      t.text     :content

      t.timestamps
    end

    create_table :lti2_tc_tool_consumer_profiles do |t|
        t.string   :tc_profile_guid
        t.text     :tc_profile

        t.timestamps
      end
    add_index :lti2_tc_tool_consumer_profiles, [:tc_profile_guid], :name => :index_tool_consumer_profiles_on_tc_profile_guid, :unique => true

    create_table :lti2_tc_tool_settings do |t|
      t.integer :tool_id
      t.integer :scopeable_id
      t.string  :scopeable_type
      t.string  :name
      t.string  :value

      t.timestamps
    end

    create_table :lti2_tc_tools do |t|
      t.text     :tool_proxy
      t.boolean  :is_enabled
      t.string   :product_name
      t.string   :description
      t.string   :key
      t.string   :secret
      t.string   :end_registration_id
      t.string   :status
      t.integer  :new_deployment_request_id
      t.string   :registration_return_url

      t.timestamps
    end

    add_index :lti2_tc_tools, [:key], :name => :index_tools_on_key, :unique => true

  end
end