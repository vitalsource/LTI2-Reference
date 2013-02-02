  
include Lti2Commons
include Signer
include MessageSupport
include OAuth::OAuthProxy

class ApplicationController < ActionController::Base
  protect_from_forgery

  def pre_process_tenant
    # OAuth check here
    tool_provider_registry = Rails.application.config.tool_provider_registry 

    key = request.parameters['oauth_consumer_key']
    unless key
      if is_parameters_in_flash
        # no oauth_consumer_key but but flash has been saved from *last* request
        return
      else
        raise "Improper LTI context"
      end
    end
    @tool_deployment = ToolDeployment.where(:key => key).first
    unless @tool_deployment
      raise "No existing tools for this partner"
    end
    
    @tenant = @tool_deployment.tenant
    raise "Could not locate tenant" unless @tenant
    request.parameters['_tenant_id'] = @tenant.id

    @tool_deployment = ToolDeployment.where(:key => key).first
    tool_proxy = JsonWrapper.new(@tool_deployment.tool_proxy)
    secret = @tool_deployment.secret
    
    unless tool_provider_registry.relaxed_oauth_check == 'true'
      request_wrapper = OAuthRequest.create_from_rack_request request
      unless request_wrapper.verify_signature? secret, Rails.application.config.nonce_cache
        # puts "Secret: #{secret}"
        puts "TP Signed Request: #{request_wrapper.signature_base_string}"
        raise "Invalid signature"
      end
      request[:lti_context] = request.parameters
    end
  end
  
  protected 
  
  def lti_link_to(path, parameters)
    parameter_addends = {
      'lti_version' => 'LTI-1p0',
      'lti_message_type' => 'basic-lti-launch-request',
      'resource_link_id' => '12345',
      'user_id' => 'lti2.user',
      'roles' => 'student',
    }
    
    parameters.merge! parameter_addends
    
    service_endpoint = "http://bc.vitalsource.com" + path
    key = '640e19b0-5ff8-11e2-bcfd-0800200c9a66'
    secret = 'A83C3F8E864CA11A'
    
    signed_request = Signer::create_signed_request service_endpoint, 'post', key, secret, parameters
    # puts "TC Signed Request: #{signed_request.signature_base_string}"    # parameters['oauth_signature'] = Base64.encode64( OpenSSL::HMAC.digest( OpenSSL::Digest::Digest.new( 'sha1' ), secret+"&", "#{signed_request.signature_base_string}" ) ).chomp.gsub( /\n/, '' )
    MessageSupport::create_lti_message_body(service_endpoint, parameters, Rails.application.config.wire_log, "Launch to external tool")
  end
  
  def is_parameters_in_flash
    not flash[:lti_context].nil?
  end
  
  def restore_request_parameters_from_flash
    request[:lti_context] = flash[:lti_context]
  end
  
  def save_request_parameters_to_flash
    flash[:lti_context] = request.parameters.dup
  end
end
