class PruneLti2TpTables < ActiveRecord::Migration
  def change
    drop_table :lti2_registrations
    drop_table :lti2_tp_contexts
    drop_table :lti2_registries
    drop_table :lti2_tool_deployments
    drop_table :lti2_tools
  end
end
