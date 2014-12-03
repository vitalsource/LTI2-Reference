class CleanupForLti21 < ActiveRecord::Migration
  def change
    remove_column :lti2_tc_deployment_requests, :tool_proxy_guid
    rename_column :lti2_tc_deployment_requests, :end_registration_id, :correlation_value
    remove_column :lti2_tc_tools, :end_registration_id
    remove_column :lti2_tc_tools, :new_deployment_request_id
  end
end
