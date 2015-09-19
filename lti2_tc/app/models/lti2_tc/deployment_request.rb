include Lti2Commons
include MessageSupport
include Signer

module Lti2Tc

  class DeploymentRequest < ActiveRecord::Base

    after_initialize :initialize_fields
    
    def create_lti_message( base_url, current_user )
      parameters = create_request_tool_deployment( base_url, current_user.to_s )
      create_lti_message_body( partner_url, parameters,
        Rails.application.config.wire_log, 'Request Tool Registration' )
    end

    def create_request_tool_deployment( base_url, user_id, lti_message_type = 'ToolProxyRegistrationRequest' )
      parameters = {
          'lti_message_type' => lti_message_type,
          'lti_version' => 'LTI-2p0',
          'user_id' => "#{user_id}",
          'roles' => 'urn:lti:sysrole:ims/lis/SysAdmin',
          'tc_profile_url' => "#{base_url}/lti2_tc/tool_consumer_profiles/#{self.tc_profile_guid}",
          'reg_key' => self.reg_key,
          'reg_password' => self.reg_password,
          'launch_presentation_return_url' => "#{base_url}/admin/tool_actions",
          'launch_presentation_document_target' => 'window'
      }
    end

    private

    def initialize_fields
      unless persisted?
        self.reg_key = UUID.generate
        self.tc_profile_guid = UUID.generate
        self.reg_password = SecureRandom.hex
        self.status = 'prepared'
      end
    end
  end
end
