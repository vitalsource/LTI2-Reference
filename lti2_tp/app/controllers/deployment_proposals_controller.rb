# Class to hold short-term object while a Tenant and ToolProxy are created.
#
# This state must persist across multiple operations:
#   Initial creation from incoming LTI2 Tool Proxy Deployment Request
#   Form to gather supplementary information from TC admin
#   Validation of that form
#   Invoke service to fetch tool_consumer_profile
#   Create tool_proxy
#   Register tool_proxy with TC
#   Clean up
#
# While it's possible to hold this proposal state in session, this design elevates 
# it to a first-class object for traceability and didactic purposes.
#
class DeploymentProposalsController < InheritedResources::Base
  protect_from_forgery :except => :create 
  
  include Lti2Commons
  include MessageSupport
  include Signer
  
  TCP_HOLDER_NAME = 'tool_consumer_profile'
  
  def create
    if params.has_key? 'Lti_message_type' or params.has_key? 'lti_message_type'
      # this signals initial POST from TC
      Lti2TpContext.get_holder(session).clear(TCP_HOLDER_NAME)

      @deployment_proposal = DeploymentProposal.new 
      @deployment_proposal.user_id = params['user_id']
      @deployment_proposal.tc_profile_url = params['tc_profile_url']
      @deployment_proposal.reg_key = params['reg_key']
      @deployment_proposal.reg_password = params['reg_password']
      @deployment_proposal.launch_presentation_return_url = params['launch_presentation_return_url']
      @deployment_proposal.message_type = "registration"
      @deployment_proposal.status = "received"

      get_tool_consumer_profile Lti2TpContext.get_holder(session), params['tc_profile_url'], params['reg_key'], params['reg_password'], response
      tcp_wrapper = JsonWrapper.new @tool_consumer_profile
      @deployment_proposal.tenant_name = tcp_wrapper.first_at('product_instance.product_info.product_name.default_value')      
      @deployment_proposal.save

      return render_view 
    else
      # reentry from form
      puts request.inspect
    end
  end
  
  def reregister
    pre_process_tenant
    Lti2TpContext.get_holder(session).clear(TCP_HOLDER_NAME)

    #@deployment_proposal = DeploymentProposal.where(:tenant_name => @tenant.tenant_name).first
    #@deployment_proposal.tenant_name = @tenant.tenant_name

    @deployment_proposal = DeploymentProposal.new
    @deployment_proposal.tenant_name = @tenant.tenant_name
    @deployment_proposal.user_id = params['user_id']
    @deployment_proposal.tc_profile_url = params['tc_profile_url']
    @deployment_proposal.launch_presentation_return_url = params['launch_presentation_return_url']
    @deployment_proposal.message_type = "reregistration"
    @deployment_proposal.status = "received"
    
    # Use OLD key/secret to send NEW ToolProxy
    @deployment_proposal.reg_key = @tool_deployment.key
    @deployment_proposal.reg_password = @tool_deployment.secret

    get_tool_consumer_profile Lti2TpContext.get_holder(session), @deployment_proposal.tc_profile_url, @tool_deployment.key, @tool_deployment.secret, response
    tcp_wrapper = JsonWrapper.new @tool_consumer_profile
    #@deployment_proposal.tenant_name = tcp_wrapper.first_at('product_instance.product_info.product_name.default_value')
    @deployment_proposal.save

    return render_view 
  end
  
  def update
    get_tool_consumer_profile Lti2TpContext.get_holder(session)
    form_params = request.params['deployment_proposal']
    @deployment_proposal = DeploymentProposal.find(request.params[:id])
    @deployment_proposal.tenant_name = form_params['tenant_name']

    is_tenant_exists = Tenant.where(:tenant_name=>@deployment_proposal.tenant_name).exists?
    if @deployment_proposal.message_type == "registration" and is_tenant_exists
      @deployment_proposal.errors[:tenant_name] << "Institution name is already in database"
      return render_view
    elsif @deployment_proposal.message_type == "reregistration" and not is_tenant_exists
      raise "Attempt to reregister but not tenant currently exists"
    end
    
    @tool_options = []
    params.each {|p|
      if p.first =~ /^tool_/
        @tool_options << p.first[5..-1]
      end
    }
    
    if @tool_options.length == 0
      @deployment_proposal.errors[:tenant_name] << "You must check at least one tool below to download"
      return render_view
    end
    
    @deployment_proposal.save!

    show
  end
  
  def show
    @deployment_proposal = DeploymentProposal.find(request.params[:id])
    # For now assume, a single tool for this provider
    
    if @deployment_proposal.message_type == "registration"
      show_registration
    else
      show_reregistration
    end
  end
    
  def show_registration
    tenant = Tenant.new
    tenant.tenant_name = @deployment_proposal.tenant_name
    begin
      tenant.save!
    rescue Exception => exc
      @deployment_proposal.errors[:tenant_key] << "tenant must match verify_tenant_key"
      return render_view 
    end

    @tool = Tool.first
    tool_proxy = create_tool_proxy @deployment_proposal.tc_profile_url, get_tool_consumer_profile(Lti2TpContext.get_holder(session)),
                                  @tool.get_tool_profile(@tool_options), UUID.generate
    if tool_proxy
      service_offered = nil
      get_tool_consumer_profile(Lti2TpContext.get_holder(session))['service_offered'].select do |entry|
        if match_services(entry['@id'] , ':ToolProxy.collection')
          service_offered = entry
          break
        end
      end
      if service_offered.nil?
        disposition = create_disposition(false, nil, "No matching service definition")
        return_url = @deployment_proposal.launch_presentation_return_url + "?status=failure"
        (redirect_to return_url) and return
      end

      (tool_proxy_response, err_code, err_msg) = register_tool_proxy get_tool_consumer_profile(Lti2TpContext.get_holder(session)), tool_proxy, service_offered, "post"
      unless err_code == 201
        disposition = create_disposition(false, nil, "#{err_code}-#{err_msg}")
        return_url = @deployment_proposal.launch_presentation_return_url + disposition
        (redirect_to return_url) and return
      end
      # get guid from the response returned by the TC
      tool_proxy['tool_proxy_guid'] = tool_proxy_response['tool_proxy_guid']
      
      @deployment_proposal.status = "registered"
      @deployment_proposal.save!
      
      # if reregistration, clear old tools for tenant 
      tool_deployment = ToolDeployment.new
      tool_deployment.tenant_id = tenant.id
      tool_deployment.tool_id = @tool.id
      tool_deployment.product_name = @tool.tool_name

      tool_proxy_wrapper = JsonWrapper.new tool_proxy
      tool_deployment.key = tool_proxy_wrapper.first_at('tool_proxy_guid')
      tool_deployment.secret = tool_proxy_wrapper.first_at('security_contract.shared_secret')
      
      # substitute tool_proxy_guid now in the Proxy where needed
      tool_proxy_wrapper.substitute_text_in_all_nodes '{', '}', {'tool_proxy_guid' => tool_proxy['tool_proxy_guid']}       
      
      tool_deployment.tool_proxy = JSON.pretty_generate tool_proxy
      tool_deployment.save!
      
      disposition = create_disposition(true, tool_proxy_wrapper.first_at('tool_proxy_guid'))
    else 
      disposition = create_disposition(false, nil, "Can't access ToolProxy")
    end
      
    return_url = @deployment_proposal.launch_presentation_return_url + disposition
    
    redirect_to return_url
  end
  
  def show_reregistration
    tenant = Tenant.where(:tenant_name=>@deployment_proposal.tenant_name).first
    @tool = Tool.first
    tool_deployment = ToolDeployment.where(:tenant_id => tenant.id, :tool_id => @tool.id).first
    tool_proxy = create_tool_proxy @deployment_proposal.tc_profile_url, get_tool_consumer_profile(Lti2TpContext.get_holder(session)),
                                  @tool.get_tool_profile(@tool_options), tool_deployment.key
    if tool_proxy
      service_offered = nil
      get_tool_consumer_profile(Lti2TpContext.get_holder(session))['service_offered'].select do |entry|
        if match_services(entry['@id'] , ':ToolProxy.item')
          service_offered = entry
          break
        end
      end
      if service_offered.nil?
        disposition = create_disposition(false, nil, "No matching service definition")
        return_url = @deployment_proposal.launch_presentation_return_url + "?status=failure"
        redirect_to return_url
      end

      service_offered_wrapper = JsonWrapper.new service_offered
      service_offered_wrapper.substitute_text_in_all_nodes('{', '}', {'tool_proxy_guid'=> tool_deployment.key})

      (tool_proxy_response, err_code, err_msg) = register_tool_proxy get_tool_consumer_profile(Lti2TpContext.get_holder(session)), tool_proxy, service_offered, "put"
      unless err_code == 200
        disposition = create_disposition(false, nil, "#{err_code}-#{err_msg}")
        return_url = @deployment_proposal.launch_presentation_return_url + disposition
        (redirect_to return_url) and return
      end

      @deployment_proposal.status = "reregistered"
      @deployment_proposal.save!
      
      tool_proxy_wrapper = JsonWrapper.new tool_proxy
      tool_deployment.secret = tool_proxy_wrapper.first_at('security_contract.shared_secret')
      
      tool_deployment.tool_proxy = JSON.pretty_generate tool_proxy
      tool_deployment.save!

      disposition = create_disposition(true, tool_proxy_wrapper.first_at('tool_proxy_guid'))
    else
      disposition = create_disposition(false, nil, "Can't access ToolProxy")
    end
      
    return_url = @deployment_proposal.launch_presentation_return_url + disposition
    
    redirect_to return_url
  end
  
  private

  def create_disposition(is_success, tool_guid=nil, message=nil)
    disposition = "?"
    if is_success
      disposition += 'status=success&'
      disposition += "tool_guid=#{tool_guid}&" if tool_guid.present?
    else
      disposition += 'status=failure&'
      encoded_message = Rack::Utils.escape(message)
      disposition += "lti_errormsg=#{encoded_message}&lti_errorlog=#{encoded_message}&"
    end
    disposition
  end

  def create_tool_proxy tool_consumer_profile_url, tool_consumer_profile, tool_profile, tool_proxy_guid
    tool_provider_registry = Rails.application.config.tool_provider_registry 
    tool_proxy = {
      '@context' => [
          "http://purl.imsglobal.org/ctx/lti/v2/ToolProxy"
      ],
      '@type' => "ToolProxy",
      '@id' => "ToolProxyProposal_at_#{Time.now.utc.iso8601}",
      
      #for testing initial tool settings
      'custom' => {'tenant_id' => 'fab23', 'tenant_name' => 'Lumos1'},
      
      'lti_version' => 'LTI-2p0',
      'tool_proxy_guid' => tool_proxy_guid,
      'tool_consumer_profile' => tool_consumer_profile_url,
      'tool_profile' => tool_profile,
      'security_contract' => resolve_security_contract(tool_consumer_profile, tool_provider_registry)
    }
    tool_proxy_wrapper = JsonWrapper.new tool_proxy
    tool_proxy_wrapper.root
  end
 
  def get_tool_consumer_profile(lti2_context_holder, tc_profile_url=nil, key=nil, secret=nil, response=nil)
    unless tc_profile_url
      @tool_consumer_profile = lti2_context_holder[TCP_HOLDER_NAME]
    else
      tcp_response = invoke_unsigned_service(tc_profile_url, 'get', {}, {}, nil, Rails.application.config.wire_log, "Get Tool Consumer Profile")     
      @tool_consumer_profile = JSON.load tcp_response.body
      lti2_context_holder[TCP_HOLDER_NAME] = @tool_consumer_profile
      response.header = {}
    end
  
    @tool_consumer_profile
  end

  def match_services(test_service, model_service)
    service_name_pattern = /.*\W(\w+?\.\w+)$/
    m = service_name_pattern.match(test_service)
    if m.present?
      test_word = m[1]
      m = service_name_pattern.match(model_service)
      if m.present?
        model_word = m[1]
        return test_word == model_word
      end
    end
    return false
  end

  def register_tool_proxy tool_consumer_profile, tool_proxy, service_offered, method
    data = JSON.pretty_generate tool_proxy
    # data = CGI::escape(data)
    signed_request = create_signed_request \
      service_offered['endpoint'],
      method,
      @deployment_proposal.reg_key,
      @deployment_proposal.reg_password,
      {}, 
      data,
      "application/vnd.ims.lti.v2.toolproxy+json"
                   
    puts "Register request: #{signed_request.signature_base_string}"
    puts "Register secret: #{@deployment_proposal.reg_password}"
    response = invoke_service(signed_request, Rails.application.config.wire_log, "Register ToolProxy with ToolConsumer")
    if response.code.between?(200, 202)
      response_body = response.body
      response_content = JSON.load(response_body) unless response_body.strip.empty?
    else
      response_content = nil
    end
    [response_content, response.code, response.message]
   end

	def render_view
    tcp_wrapper = JsonWrapper.new @tool_consumer_profile
    params['support_email'] = tcp_wrapper.first_at('product_instance.support.email')
    params['product_name'] = @deployment_proposal.tenant_name
    
  	@tool = Tool.first
    tool_profile = @tool.get_tool_profile

    @tool_resources = []
    resources = tool_profile['resource_handler']
    resources.each { |resource|
      resource_wrapper = JsonWrapper.new resource
      @tool_resources << resource_wrapper.first_at('name.default_value')
    }
    
    render
	end
	  
  def resolve_security_contract tool_consumer_profile, tool_provider_registry
    security_contract = {}
    
    security_contract['shared_secret'] = SecureRandom.hex
    security_contract['tool_service'] = []
    
    services_offered = tool_consumer_profile['service_offered']
    services_offered.each { |service_offered|
      tool_service = {}
      tool_service['@type'] = "RestServiceProfile"
      tool_service['service'] = service_offered['endpoint']
      tool_service['action'] = service_offered['action']
      
      # following may be wrong...check on proper construction of RestService
      tool_service['format'] = service_offered['format']
      security_contract['tool_service'] << tool_service
    }
    
    security_contract
  end
end
