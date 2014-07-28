class RemoveExtras < ActiveRecord::Migration
  def up
    drop_table :resources
    drop_table :links
  end

  def down
  end
end
