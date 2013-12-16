class PruneLti2TpTables < ActiveRecord::Migration
  def change
    drop_table :deployment_proposals
    drop_table :lti2_tp_contexts
    drop_table :registries
    drop_table :tool_deployments
    drop_table :tools
  end
end
