class CreateResource < ActiveRecord::Migration
  def change
    create_table "lti2_tc_resources", :force => true do |t|
      t.integer "tool_id"
      t.string  "resource_type"
      t.string  "resource_name"
      t.string  "description"
    end

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
      t.boolean  "is_email_permissions"
    end

  end
end
c