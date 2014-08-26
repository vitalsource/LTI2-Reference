class CreateLti2TcResources < ActiveRecord::Migration
  def change
    create_table :lti2_tc_resources do |t|
      t.integer  :tool_id
      t.string   :resource_type
      t.string   :name
      t.string   :description

      t.timestamps
    end
    execute('ALTER TABLE lti2_tc_resources CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tc_resources MODIFY `resource_type` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_resources MODIFY `name` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_resources MODIFY `description` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")

    create_table :lti2_tc_links do |t|
      t.integer  :grade_item_id
      t.integer  :course_id
      t.integer  :resource_id
      t.string   :resource_link_label
      t.boolean  :is_enabled
      t.string   :link_parameters
      t.boolean  :is_name_permission
      t.boolean  :is_email_permissions

      t.timestamps
    end
    execute('ALTER TABLE lti2_tc_links CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
    execute("ALTER TABLE lti2_tc_links MODIFY `resource_link_label` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
    execute("ALTER TABLE lti2_tc_links MODIFY `link_parameters` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL;")
  end
end