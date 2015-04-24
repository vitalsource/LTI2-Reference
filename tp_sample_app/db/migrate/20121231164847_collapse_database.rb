class CollapseDatabase < ActiveRecord::Migration
  def change

    create_table :deployment_proposals do |t|
      t.string   :tenant_key
      t.string   :tenant_name
      t.string   :user_id
      t.string   :reg_key
      t.string   :reg_password
      t.string   :tc_profile_url
      t.string   :launch_presentation_return_url
      t.string   :status
      t.string   :message_type

      t.timestamps
    end

    create_table :iresources do |t|
      t.integer  :tenant_id
      t.string   :result_uri
      t.string   :userid
      t.string   :contextid
      t.float    :score

      t.timestamps
    end

    create_table :registries do |t|
      t.string   :name
      t.text     :content

      t.timestamps
    end

    create_table :tenant_users do |t|
      t.integer  :tenant_id
      t.string   :user_id
      t.string   :first_name
      t.string   :last_name
      t.string   :email

      t.timestamps
    end

    create_table :tenants do |t|
      t.string   :tenant_key
      t.string   :secret
      t.string   :tenant_name

      t.timestamps
    end
  end
end
