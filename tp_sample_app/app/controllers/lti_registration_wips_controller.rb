class LtiRegistrationWipsController < InheritedResources::Base
  def index
    action = params[:action]
    registration_id = params[:registration_id]
    registration = Lti2Tp::Registration.find(registration_id)
    @lti_registration_wip = LtiRegistrationWip.new

    @lti_registration_wip.tenant_name = registration.tenant_name
    @lti_registration_wip.tool_id = registration.tool_id
    @lti_registration_wip.registration_return_url = params[:return_url]

    tcp_wrapper = JsonWrapper.new @lti_registration_wip.tool_consumer_profile
    @lti_registration_wip.support_email = tcp_wrapper.first_at('product_instance.support.email')
    @lti_registration_wip.product_name = tcp_wrapper.first_at('product_instance.product_info.product_name.default_value')

    @lti_registration_state = 'check_tenant'

    @lti_registration_wip.save

  end

  def show
    @lti_registration_wip = LtiRegistrationWip.find(request.params[:id])
    # For now assume, a single tool for this provider

    if @lti_registration_wip.message_type == "registration"
      show_registration
    else
      raise "reregistration not yet supported"
    end
  end

  def show_registration
    @registration = Lti2Tp::Registration.find(@lti_registration_state.registration_id)

    tenant = Tenant.new
    tenant.tenant_name = @lti_registration_wip.tenant_name
    begin
      tenant.save!
    rescue Exception => exc
      @lti_registration_wip.errors[:tenant_key] << "tenant must match verify_tenant_key"
      return render_view
    end

    @registration.tenant.id = tenant.id

    @registration.prepare_tool_proxy()

    @tool = Tool.find(@registration.tool_id)

    tool_proxy = create_tool_proxy @lti_registration_wip.tc_profile_url, @lti_registration_wip.tool_consumer_profile,
                                   @tool.get_tool_profile(@tool_options), UUID.generate
    if tool_proxy
      service_offered = nil
      @lti_registration_wip['service_offered'].select do |entry|
        if match_services(entry['@id'] , ':ToolProxy.collection')
          service_offered = entry
          break
        end
      end
      if service_offered.nil?
        disposition = create_disposition(false, nil, "No matching service definition")
        return_url = @lti_registration_wip.launch_presentation_return_url + "?status=failure"
        (redirect_to return_url) and return
      end

      (tool_proxy_response, err_code, err_msg) = register_tool_proxy get_tool_consumer_profile(Lti2Tp::Context.get_holder(session)), tool_proxy, service_offered, "post"
      unless err_code == 201
        disposition = create_disposition(false, nil, "#{err_code}-#{err_msg}")
        return_url = @lti_registration_wip.launch_presentation_return_url + disposition
        (redirect_to return_url) and return
      end
      # get guid from the response returned by the TC
      tool_proxy['tool_proxy_guid'] = tool_proxy_response['tool_proxy_guid']

      @lti_registration_wip.status = "registered"
      @lti_registration_wip.save!

      # if reregistration, clear old tools for tenant
      tool_deployment = Lti2Tp::ToolDeployment.new
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

    return_url = @lti_registration_wip.launch_presentation_return_url + disposition

    redirect_to return_url
  end


  def update
    @lti_registration_wip = LtiRegistrationWip.find(params[:id])

    is_tenant_exists = Tenant.where(:tenant_name=>@lti_registration_wip.tenant_name).exists?
    if @lti_registration_wip.message_type == "registration" and is_tenant_exists
      @lti_registration_wip.errors[:tenant_name] << "Institution name is already in database"
      return render_view
    elsif @lti_registration_wip.message_type == "reregistration" and not is_tenant_exists
      raise "Attempt to reregister but not tenant currently exists"
    end

    @tool_options = []
    params.each {|p|
      if p.first =~ /^tool_/
        @tool_options << p.first[5..-1]
      end
    }

    if @tool_options.length == 0
      @lti_registration_wip.errors[:tenant_name] << "You must check at least one tool below to download"
      return render_view
    end

    @lti_registration_wip.save!

    show
  end

  private

  def create_tool_proxy tool_consumer_profile_url, tool_consumer_profile, tool_profile, tool_proxy_guid
    tool_provider_registry = Rails.application.config.tool_provider_registry
    tool_proxy = { }
    tool_proxy['@context'] = [
        "http://purl.imsglobal.org/ctx/lti/v2/ToolProxy"
    ]
    tool_proxy['@type'] = "ToolProxy"
    tool_proxy['@id'] = "ToolProxyProposal_at_#{Time.now.utc.iso8601}"

    tool_proxy['lti_version'] = 'LTI-2p0'
    tool_proxy['tool_proxy_guid'] = tool_proxy_guid
    tool_proxy['tool_consumer_profile'] = tool_consumer_profile_url
    tool_proxy['tool_profile'] = tool_profile
    tool_proxy['security_contract'] = resolve_security_contract(tool_consumer_profile, tool_provider_registry)

    tool_proxy_wrapper = JsonWrapper.new tool_proxy
    tool_proxy_wrapper.root
  end
end
