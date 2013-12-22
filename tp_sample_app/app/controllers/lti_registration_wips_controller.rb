class LtiRegistrationWipsController < InheritedResources::Base
  def index
    action = params[:action]
    registration_id = params[:registration_id]
    registration = Lti2Tp::Registration.find(registration_id)
    @lti_registration_wip = LtiRegistrationWip.new

    @lti_registration_wip.tenant_name = registration.tenant_name
    @lti_registration_wip.registration_id = registration_id
    @lti_registration_wip.registration_return_url = params[:return_url]

    tcp_wrapper = JsonWrapper.new JSON.load(registration.tool_consumer_profile_json)
    @lti_registration_wip.support_email = tcp_wrapper.first_at('product_instance.support.email')
    @lti_registration_wip.product_name = tcp_wrapper.first_at('product_instance.product_info.product_name.default_value')

    @lti_registration_state = 'check_tenant'

    @lti_registration_wip.save

  end

  def show
    @lti_registration_wip = LtiRegistrationWip.find(request.params[:id])
    registration = Lti2Tp::Registration.find(@lti_registration_wip.registration_id)
    if registration.message_type == "registration"
      show_registration
    else
      raise "reregistration not yet supported"
    end
  end

  def show_registration
    registration = Lti2Tp::Registration.find(@lti_registration_wip.registration_id)

    tenant = Tenant.new
    tenant.tenant_name = @lti_registration_wip.tenant_name
    begin
      tenant.save!
    rescue Exception => exc
      (@lti_registration_wip.errors[:tenant_name] << "Institution name is already in database") and return
    end

    disposition = registration.prepare_tool_proxy()

    tool_proxy_wrapper = JsonWrapper.new(registration.tool_proxy_json)

    tenant.tenant_key = tool_proxy_wrapper.first_at('tool_proxy_guid')
    tenant.secret = tool_proxy_wrapper.first_at('security_contract.shared_secret')
    tenant.save

    registration.tenant_id = tenant.id
    registration.save

    redirect_to "#{@lti_registration_wip.registration_return_url}#{disposition}&id=#{registration.id}"
  end


  def update
    @lti_registration_wip = LtiRegistrationWip.find(params[:id])
    @lti_registration_wip.tenant_name = params[:lti_registration_wip][:tenant_name]
    @lti_registration_wip.save

    show
  end
end
