class DeploymentProposal < ActiveRecord::Base
  attr_accessible :launch_presentation_return_url, :reg_key, :reg_password, :status, 
                  :tc_profile_url, :tenant_name, :user_id
end
