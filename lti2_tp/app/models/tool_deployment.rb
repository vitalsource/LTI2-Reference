class ToolDeployment < ActiveRecord::Base
  belongs_to :tenant
  
  attr_accessible :tool_name, :tenant_id, :tool_id, :tool_proxy
end
