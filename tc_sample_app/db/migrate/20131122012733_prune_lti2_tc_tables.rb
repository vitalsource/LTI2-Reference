class PruneLti2TcTables < ActiveRecord::Migration
  def change
    drop_table :deployment_requests
    drop_table :registries
    drop_table :tool_consumer_profiles
    drop_table :tool_settings
    drop_table :tools
  end
end
