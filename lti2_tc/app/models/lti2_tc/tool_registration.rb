module Lti2Tc
  class ToolRegistration
    def self.remap_tool_consumer_profile( tool_consumer_profile_wrapper, tc_profile_guid )
      tool_consumer_profile_wrapper.substitute_text_in_all_nodes(
        '{', '}', { 'tool_consumer_profile_guid' => tc_profile_guid }
      )
      tool_consumer_profile_wrapper.root['guid'] = tc_profile_guid
      JSON.pretty_generate( tool_consumer_profile_wrapper.root )
    end

    def self.register_tool( user, deployment_request, tool_consumer_profile_wrapper, tc_deployment_url )
      unless deployment_request.status == 'prepared'
        if deployment_request.status == 'submitted'
          raise 'This deployment request has already been send to the Tool Provider'
        elsif deployment_request.status == 'registered'
          raise 'This deployment request has already been provisioned. Consider a Reregistration request.'
        else
          raise 'Invalid status for deployment request'
        end
      end

      tool_proxy_guid = nil
      # Old style tool_proxy_guid reassignment happens here
      # Only comment out to test old-style ('late') tool_proxy_guid creation
      tool_proxy_guid = UUID.generate

      deployment_request.status = 'submitted'
      deployment_request.save

      tool_consumer_profile = Lti2Tc::ToolConsumerProfile.new
      tool_consumer_profile.tc_profile = remap_tool_consumer_profile(
        tool_consumer_profile_wrapper, deployment_request.tc_profile_guid
      )
      tool_consumer_profile.tc_profile_guid = deployment_request.tc_profile_guid
      tool_consumer_profile.save

      html_body = deployment_request.create_lti_message( tc_deployment_url, user.id, tool_proxy_guid )

      html_body
    end

    def self.reregister_tool( user, deployment_request, tool, tool_consumer_profile,
      tool_consumer_profile_wrapper, tc_deployment_url, launch_presentation_return_url )

      tool_proxy = tool.get_tool_proxy
      tp_base_url = tool_proxy.select('tool_profile.base_url_choice',
              "selector.applies_to", "MessageHandler", 'default_base_url')
      singleton_messages = tool_proxy.first_at( 'tool_profile.message' )
      service_endpoint = nil
      singleton_messages.each { |singleton_message|
        message_types = singleton_message['message_type']
        if message_types.include? 'ToolProxyReregistrationRequest'
          service_endpoint = singleton_message['path']
          break
        end
      }
      raise 'No message handler found for ToolProxyRegistrationRequest' unless service_endpoint

      # deployment_request = DeploymentRequest.new
      deployment_request.status = 'reregistering'
      deployment_request.save

      # tool_consumer_profile = ToolConsumerProfile.new
      current_tcp = Lti2Tc::ToolConsumerProfile.where(:tc_profile_guid => deployment_request.tc_profile_guid).first
      tool_consumer_profile = current_tcp if current_tcp.present?
      tool_consumer_profile.tc_profile = remap_tool_consumer_profile(
        tool_consumer_profile_wrapper, deployment_request.tc_profile_guid
      )
      tool_consumer_profile.tc_profile_guid = deployment_request.tc_profile_guid
      tool_consumer_profile.save

      # convert parameters
      parameters = {}
      tc_base_url = tc_deployment_url
      parameters['tc_profile_url'] = "#{tc_base_url}/lti2_tc/tool_consumer_profiles/#{tool_consumer_profile.tc_profile_guid}"
      parameters['launch_presentation_return_url'] = launch_presentation_return_url
      parameters['lti_message_type'] = 'ToolProxyReregistrationRequest'

      key = tool_proxy.first_at( 'tool_proxy_guid' )
      secret = tool.secret

      signed_request = Signer::create_signed_request( service_endpoint, 'post', key, secret, parameters )
      puts "TC Signed Request: #{signed_request.signature_base_string}"
      body = MessageSupport::create_lti_message_body( service_endpoint, parameters,
        Rails.application.config.wire_log, 'Reregister Tool' )
      body
    end
  end
end
