class CollapseLumosDb < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string   :email,                  :default => "", :null => false
      t.string   :encrypted_password,     :default => "", :null => false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count,          :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :user_id
      t.string   :first_name
      t.string   :last_name
      t.string   :role
      t.string   :mentor

      t.timestamps
    end
    add_index "admin_users", ["email"], name => "index_admin_users_on_email", :unique => true
    add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

    create_table :courses do |t|
      t.string  :course_label
      t.string  :course_title

      t.timestamps
    end

    create_table :enrollments do |t|
      t.integer  :admin_user_id
      t.integer  :course_id
      t.string   :role

      t.timestamps
    end

    create_table :grade_items do |t|
      t.integer  :course_id
      t.string   :label

      t.timestamps
    end

    create_table :grade_results do |t|
      t.integer  :link_id
      t.integer  :admin_user_id
      t.float    :result

      t.timestamps
    end

  end
end