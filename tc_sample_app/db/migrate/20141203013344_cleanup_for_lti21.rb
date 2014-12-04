class CleanupForLti21 < ActiveRecord::Migration
  def change
    remove_column :lti2_tc_deployment_requests, :tool_proxy_guid, :string
    rename_column :lti2_tc_deployment_requests, :end_registration_id, :confirm_url
    remove_column :lti2_tc_tools, :end_registration_id, :string
    remove_column :lti2_tc_tools, :new_deployment_request_id, :int
  end
end
