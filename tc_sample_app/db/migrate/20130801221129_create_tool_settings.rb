class CreateToolSettings < ActiveRecord::Migration
  def change
    create_table "tool_settings" do |t|
      t.references  :tool
      t.references  :scopeable, :polymorphic => :true
      t.string      :name
      t.string      :value
    end
  end
end
