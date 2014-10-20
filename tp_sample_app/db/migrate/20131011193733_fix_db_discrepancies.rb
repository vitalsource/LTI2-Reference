class FixDbDiscrepancies < ActiveRecord::Migration
  def change
    add_column :deployment_proposals, :tenant_key, :string, :after => :id
  end
end
