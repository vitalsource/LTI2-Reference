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
module Lti2Tp

  class RegistrationsController < InheritedResources::Base

    protect_from_forgery :except => :create

    include Lti2Commons
    include MessageSupport
    include Signer

    TCP_HOLDER_NAME = 'tool_consumer_profile'

    def create
      # this signals initial POST from TC
      tool = params[:tool]
      if tool.present?
        tools = Tool.where(:id => tool)
        if tools.present?
          @tool = tools.first
        else
          tools = Tool.where(:tool_name => tool)
          if tools.present?
            @tool = tools.first
          end
        end
      end
      if @tool.nil?
        @tool = Tool.first
      end

      @registration = Lti2Tp::Registration.new
      @registration.user_id = params['user_id']
      @registration.tc_profile_url = params['tc_profile_url']
      @registration.reg_key = params['reg_key']
      @registration.reg_password = params['reg_password']
      @registration.launch_presentation_return_url = params['launch_presentation_return_url']
      @registration.message_type = "registration"
      @registration.status = "received"

      @tool_consumer_profile = @registration.get_tool_consumer_profile()
      tcp_wrapper = JsonWrapper.new @tool_consumer_profile

      @registration.tool_consumer_profile_json = @tool_consumer_profile.to_json
      @registration.tenant_name = tcp_wrapper.first_at('product_instance.service_owner.service_owner_name.default_value')
      @registration.tenant_id = nil
      @registration.tool_id = @tool.id
      @registration.tool_profile_json = @tool.get_tool_profile.to_json
      @registration.lti_version = @tool_consumer_profile['lti_version']

      @registration.save

      redirect_to "/lti_registration_wips?action=create&registration_id=#{@registration.id}&return_url=/lti2_tp/registrations"
    end

    def index
      registration = Lti2Tp::Registration.find(params[:id])
      final_hash = params.select {|k,v| [:status, :tool_guid, :lti_errormsg, :lti_errorlog].include? k.to_sym}
      final_qs = final_hash.to_query
      final_url = "#{registration.launch_presentation_return_url}?#{final_qs}"
      redirect_to final_url
    end

    def reregister
      pre_process_tenant
      Lti2Tp::Context.get_holder(session).clear(TCP_HOLDER_NAME)

      #@deployment_proposal = DeploymentProposal.where(:tenant_name => @tenant.tenant_name).first
      #@deployment_proposal.tenant_name = @tenant.tenant_name

      @registration = Lti2Tp::Registration.new
      @registration.tenant_name = @tenant.tenant_name
      @registration.user_id = params['user_id']
      @registration.tc_profile_url = params['tc_profile_url']
      @registration.launch_presentation_return_url = params['launch_presentation_return_url']
      @registration.message_type = "reregistration"
      @registration.status = "received"

      # Use OLD key/secret to send NEW ToolProxy
      @registration.reg_key = @tool_deployment.key
      @registration.reg_password = @tool_deployment.secret

      get_tool_consumer_profile Lti2Tp::Context.get_holder(session), @registration.tc_profile_url, @tool_deployment.key, @tool_deployment.secret, response
      tcp_wrapper = JsonWrapper.new @tool_consumer_profile
      #@deployment_proposal.tenant_name = tcp_wrapper.first_at('product_instance.product_info.product_name.default_value')
      @registration.save

      return render_view
    end

    def update
      get_tool_consumer_profile Lti2Tp::Context.get_holder(session)
      form_params = request.params['deployment_proposal']
      @registration = Lti2Tp::Registration.find(request.params[:id])
      @registration.tenant_name = form_params['tenant_name']

      is_tenant_exists = Tenant.where(:tenant_name=>@registration.tenant_name).exists?
      if @registration.message_type == "registration" and is_tenant_exists
        @registration.errors[:tenant_name] << "Institution name is already in database"
        return render_view
      elsif @registration.message_type == "reregistration" and not is_tenant_exists
        raise "Attempt to reregister but not tenant currently exists"
      end

      @tool_options = []
      params.each {|p|
        if p.first =~ /^tool_/
          @tool_options << p.first[5..-1]
        end
      }

      if @tool_options.length == 0
        @registration.errors[:tenant_name] << "You must check at least one tool below to download"
        return render_view
      end

      @registration.save!

      show
    end

    def show
      @registration = Lti2Tp::Registration.find(request.params[:id])
      # For now assume, a single tool for this provider

      if @registration.message_type == "registration"
        show_registration
      else
        show_reregistration
      end
    end

    def show_registration
      tenant = Tenant.new
      tenant.tenant_name = @registration.tenant_name
      begin
        tenant.save!
      rescue Exception => exc
        @registration.errors[:tenant_key] << "tenant must match verify_tenant_key"
        return render_view
      end

      @tool = Tool.first
      tool_proxy = create_tool_proxy @registration.tc_profile_url, get_tool_consumer_profile(Lti2Tp::Context.get_holder(session)),
                                    @tool.get_tool_profile(@tool_options), UUID.generate
      if tool_proxy
        service_offered = nil
        get_tool_consumer_profile(Lti2Tp::Context.get_holder(session))['service_offered'].select do |entry|
          if match_services(entry['@id'] , ':ToolProxy.collection')
            service_offered = entry
            break
          end
        end
        if service_offered.nil?
          disposition = create_disposition(false, nil, "No matching service definition")
          return_url = @registration.launch_presentation_return_url + "?status=failure"
          (redirect_to return_url) and return
        end

        (tool_proxy_response, err_code, err_msg) = register_tool_proxy get_tool_consumer_profile(Lti2Tp::Context.get_holder(session)), tool_proxy, service_offered, "post"
        unless err_code == 201
          disposition = create_disposition(false, nil, "#{err_code}-#{err_msg}")
          return_url = @registration.launch_presentation_return_url + disposition
          (redirect_to return_url) and return
        end
        # get guid from the response returned by the TC
        tool_proxy['tool_proxy_guid'] = tool_proxy_response['tool_proxy_guid']

        @registration.status = "registered"
        @registration.save!

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

      return_url = @registration.launch_presentation_return_url + disposition

      redirect_to return_url
    end

    def show_reregistration
      tenant = Tenant.where(:tenant_name=>@registration.tenant_name).first
      @tool = Tool.first
      tool_deployment = Lti2Tp::ToolDeployment.where(:tenant_id => tenant.id, :tool_id => @tool.id).first
      tool_proxy = create_tool_proxy @registration.tc_profile_url, get_tool_consumer_profile(Lti2Tp::Context.get_holder(session)),
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
          return_url = @registration.launch_presentation_return_url + "?status=failure"
          redirect_to return_url
        end

        service_offered_wrapper = JsonWrapper.new service_offered
        service_offered_wrapper.substitute_text_in_all_nodes('{', '}', {'tool_proxy_guid'=> tool_deployment.key})

        (tool_proxy_response, err_code, err_msg) = register_tool_proxy get_tool_consumer_profile(Lti2Tp::Context.get_holder(session)), tool_proxy, service_offered, "put"
        unless err_code == 200
          disposition = create_disposition(false, nil, "#{err_code}-#{err_msg}")
          return_url = @registration.launch_presentation_return_url + disposition
          (redirect_to return_url) and return
        end

        @registration.status = "reregistered"
        @registration.save!

        tool_proxy_wrapper = JsonWrapper.new tool_proxy
        tool_deployment.secret = tool_proxy_wrapper.first_at('security_contract.shared_secret')

        tool_deployment.tool_proxy = JSON.pretty_generate tool_proxy
        tool_deployment.save!

        disposition = create_disposition(true, tool_proxy_wrapper.first_at('tool_proxy_guid'))
      else
        disposition = create_disposition(false, nil, "Can't access ToolProxy")
      end

      return_url = @registration.launch_presentation_return_url + disposition

      redirect_to return_url
    end

  end

end
