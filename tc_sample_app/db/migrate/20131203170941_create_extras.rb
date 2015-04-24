class CreateExtras < ActiveRecord::Migration
  def change
    create_table :lti2_tc_resources do |t|
      t.integer :tool_id
      t.string  :resource_type
      t.string  :name
      t.string  :description

      t.timestamps
    end

    create_table :lti2_tc_links do |t|
      t.string   :resource_link_label
      t.boolean  :is_enabled
      t.integer  :grade_item_id
      t.integer  :course_id
      t.integer  :resource_id
      t.string   :link_parameters

      t.timestamps
    end
  end
end