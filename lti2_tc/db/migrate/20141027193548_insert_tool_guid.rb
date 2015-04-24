class InsertToolGuid < ActiveRecord::Migration
  def change
    add_column :lti2_tc_deployment_requests, :tool_proxy_guid, :string, :after => :tc_profile_guid
  end
end
