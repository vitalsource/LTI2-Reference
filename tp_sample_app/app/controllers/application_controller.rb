  
include Lti2Commons
include Signer
include MessageSupport
include OAuth::OAuthProxy

class ApplicationController < ActionController::Base
  protect_from_forgery

  def pre_process_tenant
    # no way home
    unless params.has_key?('launch_presentation_return_url')
      render :inline => "<br><br><h2>LTI launch parameters are incomplete and no return URL has been provided</h2>" and return
    end

    # OAuth check here
    tool_provider_registry = Rails.application.config.tool_provider_registry 

    key = request.parameters['oauth_consumer_key']
    unless key
      if is_parameters_in_flash
        # no oauth_consumer_key but but flash has been saved from *last* request
        return
      else
        (redirect_to redirect_url("Improper LTI context")) and return
      end
    end
    @tool_deployment = Lti2Tp::ToolDeployment.where(:key => key).first
    unless @tool_deployment
      (redirect_to redirect_url("No existing tools for this partner")) and return
    end
    
    @tenant = @tool_deployment.tenant
    if @tenant.blank?
      (redirect_to redirect_url("Could not locate tenant")) and return
    end
    request.parameters['_tenant_id'] = @tenant.id

    @tool_deployment = Lti2Tp::ToolDeployment.where(:key => key).first
    tool_proxy = JsonWrapper.new(@tool_deployment.tool_proxy)
    secret = @tool_deployment.secret
    
    unless tool_provider_registry.relaxed_oauth_check == 'true'
      request_wrapper = OAuthRequest.create_from_rack_request request
      unless request_wrapper.verify_signature? secret, Rails.application.config.nonce_cache
        # puts "Secret: #{secret}"
        puts "TP Signed Request: #{request_wrapper.signature_base_string}"
        (redirect_to redirect_url("Invalid signature")) and return
      end
      request[:lti_context] = request.parameters
    end

    # LTI conformance
    request.request_parameters['normalized_role'] = normalize_role(params['roles'])
    unless params.has_key?('resource_link_id')
      (redirect_to redirect_url("Missing resource link id")) and return
    end

    if params.has_key?('lti_version')
      lti_version = params['lti_version']
      unless ['LTI-1p0', 'LTI-2p0'].include?(lti_version)
        (redirect_to redirect_url("Invalid lti_version: #{lti_version}")) and return
      end
    else
      (redirect_to redirect_url("Missing lti_version")) and return
    end

    if params.has_key?('lti_message_type')
      lti_message_type = params['lti_message_type']
      unless ['basic-lti-launch-request', 'ToolProxyRegistrationRequest', 'ToolProxyReregistrationRequest'].include?(lti_message_type)
        (redirect_to redirect_url("Invalid lti_message_type: #{lti_message_type}")) and return
      end
    else
      (redirect_to redirect_url("Missing lti_message_type")) and return
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

  def normalize_role(roles_string)
    roles_string ||= 'learner'
    roles = roles_string.downcase.split(',')
    regex = /[\/#](\w+)$/
    roles.each do |full_role|
      # allow old urn form or new uri form
      m = regex.match(full_role)
      if m.nil?
        role = full_role
      else
        role = m[1]
      end
      if ['learner','instructor'].include?(role)
        return role
      end
    end
    'learner'
  end

  def redirect_url(msg)
    msg = Rack::Utils.escape(msg)
    "#{params['launch_presentation_return_url']}?status=failure&lti_errormsg=#{msg}&lti_errorlog=#{msg}"
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

  def restore_request_parameters_from_session
    request[:lti_context] = session[:lti_context]
    session[:lti_context] = nil
  end

  def save_request_parameters_to_session
    session[:lti_context] = request.parameters.dup
  end
end
