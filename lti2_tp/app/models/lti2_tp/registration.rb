module Lti2Tp
  class Registration < ActiveRecord::Base

    ACKNOWLEDGE_URL = 'VND-IMS-CONFIRM-URL'
    HTTP_ACKNOWLEDGE_URL = 'HTTP_VND_IMS_CONFIRM_URL'

    def create_tool_proxy tool_consumer_profile, tool_proxy_guid, disposition
      tool_proxy = {}
      # clone from provided TCP
      tool_proxy['@context'] = tool_consumer_profile['@context'].clone
      tool_proxy['@type'] = 'ToolProxy'
      tool_proxy['@id'] = "ToolProxyProposal_at_#{Time.now.utc.iso8601}"

      tool_proxy['lti_version'] = 'LTI-2p0'
      tool_proxy['tool_proxy_guid'] = tool_proxy_guid

      tool_proxy['tool_consumer_profile'] = self.tc_profile_url
      tool_proxy['tool_profile'] = JSON.load( tool_profile_json )
      tool_proxy['security_contract'] = resolve_security_contract( tool_consumer_profile )

      tool_proxy_wrapper = JsonWrapper.new( tool_proxy )
      tool_proxy_wrapper.substitute_text_in_all_nodes( '{', '}', { 'tool_proxy_guid' => tool_proxy['tool_proxy_guid'] } )

      tool_proxy_wrapper.root
    end

    def get_tool_consumer_profile()
      tcp_response = invoke_unsigned_service(self.tc_profile_url, 'get', {}, {}, nil, Rails.application.config.wire_log, "Get Tool Consumer Profile")
      JSON.load( tcp_response.body )
    end

    def prepare_tool_proxy disposition
      tool_consumer_profile = JSON.load( self.tool_consumer_profile_json )
      tool_proxy = create_tool_proxy(tool_consumer_profile, self.reg_key, disposition)
      if tool_proxy
        self.end_registration_id = UUID.generate
        if disposition == 'register'
          self.tool_proxy_json = tool_proxy.to_json
        else
          self.proposed_tool_proxy_json = tool_proxy.to_json
        end
        self.save!

        service_offered = nil
        tool_consumer_profile['service_offered'].select do |entry|
          if match_services( entry['@id'] , ':ToolProxy.collection' )
            service_offered = entry
            break
          end
        end
        if service_offered.nil?
          status = create_status(false, nil, "No matching service definition")
          return_url = self.launch_presentation_return_url + '?status=failure'
          (redirect_to return_url) and return
        end

        (tool_proxy_response, err_code, err_msg) = register_tool_proxy service_offered, "post", disposition
        unless err_code == 201
          status = create_status(false, nil, "#{err_code}-#{err_msg}")
          return status
        end
        if disposition.blank? || disposition == 'register' || disposition == 'reregister'
          tool_proxy_wrapper = JsonWrapper.new( tool_proxy )

          self.tool_proxy_json = tool_proxy.to_json
          self.tool_proxy_response = tool_proxy_response.to_json
          self.status = disposition
          self.save!

          status = create_status(true, tool_proxy_wrapper.first_at('tool_proxy_guid'))
        else
          status = create_status(true)
        end
      else
        status = create_status(false, nil, "Can't access ToolProxy")
      end

      status
    end

    def create_status(is_success, tool_guid=nil, message=nil)
      status = "?"
      if is_success
        status += 'status=success&'
        status += "tool_guid=#{tool_guid}&" if tool_guid.present?
      else
        status += 'status=failure&'
        encoded_message = Rack::Utils.escape( message )
        status += "lti_errormsg=#{encoded_message}&lti_errorlog=#{encoded_message}&"
      end
      status
    end

    def is_status_failure? status
      status.include? "status=failure&"
    end

    private

    def match_services( test_service, model_service )
      service_name_pattern = /.*\W(\w+?\.\w+)$/
      m = service_name_pattern.match( test_service )
      if m.present?
        test_word = m[1]
        m = service_name_pattern.match( model_service )
        if m.present?
          model_word = m[1]
          return test_word == model_word
        end
      end
      return false
    end

    def register_tool_proxy service_offered, method, disposition
      if disposition == 'register'
      data = self.tool_proxy_json
        label = 'Register'
      else
        data = self.proposed_tool_proxy_json
        label = 'ReRegister'
      end

      data = JSON.pretty_generate(JSON.load(data))

      # data = CGI::escape(data)
      signed_request = create_signed_request \
        service_offered['endpoint'],
        method,
        self.reg_key,
        self.reg_password,
        {},
        data,
        "application/vnd.ims.lti.v2.toolproxy+json"

      puts "Register request: #{signed_request.signature_base_string}"
      puts "Register secret: #{self.reg_password}"

      headers = {}
      if disposition == 'reregister'
        tool_provider_registry = Rails.application.config.tool_provider_registry
        base_url = "#{tool_provider_registry.tp_deployment_url}/lti2_tp/tool_proxies/#{self.reg_key}?correlation=#{self.end_registration_id}"
      end
      (headers[ACKNOWLEDGE_URL] = base_url) if disposition == 'reregister'
      response = invoke_service(signed_request, Rails.application.config.wire_log, "#{label} ToolProxy with ToolConsumer",
          headers)
      if response.code.between?( 200, 202 )
        response_body = response.body
        response_content = JSON.load( response_body ) unless response_body.strip.empty?
      else
        response_content = nil
      end
      [ response_content, response.code, response.message ]
    end


    def resolve_security_contract tool_consumer_profile
      security_contract = {}

      if (tool_consumer_profile['capability_offered'].include? 'OAuth.splitSecret')
        tp_half_shared_secret = SecureRandom.hex(64)
        security_contract['tp_half_shared_secret'] = tp_half_shared_secret
      else
        secret = SecureRandom.hex
        security_contract['shared_secret'] = secret
      end

      security_contract['tool_service'] = []

      services_offered = tool_consumer_profile['service_offered']
      services_offered.each { |service_offered|
        tool_service = {}
        tool_service['@type'] = 'RestServiceProfile'
        tool_service['service'] = service_offered['@id']
        tool_service['action'] = service_offered['action']

        # following may be wrong...check on proper construction of RestService
        # tool_service['format'] = service_offered['format']
        security_contract['tool_service'] << tool_service
      }

      security_contract
    end

  end
end
