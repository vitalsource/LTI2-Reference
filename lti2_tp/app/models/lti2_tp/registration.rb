module Lti2Tp

  class Registration < ActiveRecord::Base

    def create_tool_proxy( tool_consumer_profile, tool_proxy_guid )
      tool_proxy = {}
      tool_proxy['@context'] = [
        'http://purl.imsglobal.org/ctx/lti/v2/ToolProxy'
      ]
      tool_proxy['@type'] = 'ToolProxy'
      tool_proxy['@id'] = "ToolProxyProposal_at_#{Time.now.utc.iso8601}"

      tool_proxy['lti_version'] = 'LTI-2p0'
      tool_proxy['tool_proxy_guid'] = tool_proxy_guid
      tool_proxy['tool_consumer_profile'] = self.tc_profile_url
      tool_proxy['tool_profile'] = JSON.load( tool_profile_json )
      tool_proxy['security_contract'] = resolve_security_contract( tool_consumer_profile )

      tool_proxy_wrapper = JsonWrapper.new( tool_proxy )
      tool_proxy_wrapper.root
    end

    def get_tool_consumer_profile
      tcp_response = invoke_unsigned_service( self.tc_profile_url, 'get', {}, {}, nil, nil, 'Get Tool Consumer Profile' )
      JSON.load( tcp_response.body )
    end

    def prepare_tool_proxy
      tool_consumer_profile = JSON.load( self.tool_consumer_profile_json )
      tool_proxy = create_tool_proxy( tool_consumer_profile, UUID.generate )
      if tool_proxy
        self.tool_proxy_json = tool_proxy.to_json
        service_offered = nil
        tool_consumer_profile['service_offered'].select do |entry|
          if match_services( entry['@id'] , ':ToolProxy.collection' )
            service_offered = entry
            break
          end
        end
        if service_offered.nil?
          disposition = create_disposition( false, nil, 'No matching service definition' )
          return_url = self.launch_presentation_return_url + '?status=failure'
          redirect_to return_url
          return
        end

        (tool_proxy_response, err_code, err_msg) = register_tool_proxy( service_offered, 'post' )
        unless err_code == 201
          disposition = create_disposition( false, nil, "#{err_code}-#{err_msg}" )
          return disposition
        end
        # get guid from the response returned by the TC
        tool_proxy['tool_proxy_guid'] = tool_proxy_response['tool_proxy_guid']

        # substitute tool_proxy_guid now in the Proxy where needed
        tool_proxy_wrapper = JsonWrapper.new( tool_proxy )
        tool_proxy_wrapper.substitute_text_in_all_nodes( '{', '}', { 'tool_proxy_guid' => tool_proxy['tool_proxy_guid'] } )

        self.tool_proxy_json = tool_proxy.to_json
        self.status = 'registered'
        self.save!

        disposition = create_disposition( true, tool_proxy_wrapper.first_at('tool_proxy_guid') )
      else
        disposition = create_disposition( false, nil, "Can't access ToolProxy" )
      end

      disposition
    end

    def create_disposition( is_success, tool_guid=nil, message=nil )
      disposition = '?'
      if is_success
        disposition += 'status=success&'
        disposition += "tool_guid=#{tool_guid}&" if tool_guid.present?
      else
        disposition += 'status=failure&'
        encoded_message = Rack::Utils.escape( message )
        disposition += "lti_errormsg=#{encoded_message}&lti_errorlog=#{encoded_message}&"
      end
      disposition
    end

    def is_disposition_failure? disposition
      disposition.include? 'status=failure&'
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

    def register_tool_proxy( service_offered, method )
      data = self.tool_proxy_json
      # data = CGI::escape(data)
      signed_request = create_signed_request(
        service_offered['endpoint'],
        method,
        self.reg_key,
        self.reg_password,
        {},
        data,
        'application/vnd.ims.lti.v2.toolproxy+json'
      )

      puts "Register request: #{signed_request.signature_base_string}"
      puts "Register secret: #{self.reg_password}"
      response = invoke_service( signed_request, Rails.application.config.wire_log, 'Register ToolProxy with ToolConsumer' )
      if response.code.between?( 200, 202 )
        response_body = response.body
        response_content = JSON.load( response_body ) unless response_body.strip.empty?
      else
        response_content = nil
      end
      [ response_content, response.code, response.message ]
    end

    def resolve_security_contract( tool_consumer_profile )
      security_contract = {}

      security_contract['shared_secret'] = SecureRandom.hex
      security_contract['tool_service'] = []

      services_offered = tool_consumer_profile['service_offered']
      services_offered.each { |service_offered|
        tool_service = {}
        tool_service['@type'] = 'RestServiceProfile'
        tool_service['service'] = service_offered['endpoint']
        tool_service['action'] = service_offered['action']

        # following may be wrong...check on proper construction of RestService
        # tool_service['format'] = service_offered['format']
        security_contract['tool_service'] << tool_service
      }

      security_contract
    end

  end

end
