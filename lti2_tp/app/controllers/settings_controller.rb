class SettingsController < ApplicationController

  def create
    oauth_consumer_key = params['oauth_consumer_key']
    if oauth_consumer_key.present?
      logger.info "PrePreProcessTenant"
      (status, message, message_key) = pre_process_tenant

      output = "<h2>Diagnostics Tool</h2>\n"
      return_url = request.request_parameters['launch_presentation_return_url']
      output += "<form method=\"POST\">"
      output += "<input type='hidden' name='tool_deployment_id' value='" + @tool_deployment.id.to_s + "'/>"

      present_settings = ['custom_tool_proxy_custom_url', 'custom_tool_proxy_binding_custom_url', 'custom_lti_link_custom_url'] & params.keys

      if present_settings.length > 0
        output += "<input type='hidden' name='custom_tool_proxy_custom_url' value='" + params['custom_tool_proxy_custom_url'] + "'/>" if present_settings.include?('custom_tool_proxy_custom_url')
        output += "<input type='hidden' name='custom_tool_proxy_binding_custom_url' value='" + params['custom_tool_proxy_binding_custom_url'] + "'/>" if present_settings.include?('custom_tool_proxy_binding_custom_url')
        output += "<input type='hidden' name='custom_lti_link_custom_url' value='" + params['custom_lti_link_custom_url']   + "'/>" if present_settings.include?('custom_lti_link_custom_url')

        if present_settings.include?('custom_tool_proxy_custom_url')
          output += "<h3>ToolProxy Settings</h3>"
          output += "<textarea cols=\"40\" rows=\"5\" name=\"toolproxy\">" + fetch_settings('ToolProxy', params['custom_tool_proxy_custom_url']) + "</textarea>"
        end

        if present_settings.include?('custom_tool_proxy_binding_custom_url')
          output += "<h3>ToolProxyBinding Settings</h3>"
          output += "<textarea cols=\"40\" rows=\"5\" name=\"toolproxybinding\">" + fetch_settings('ToolProxy', params['custom_tool_proxy_binding_custom_url']) + "</textarea>"
        end

        if present_settings.include?('custom_lti_link_custom_url')
          output += "<h3>LtiLink Settings</h3>"
          output += "<textarea cols=\"40\" rows=\"5\" name=\"ltilink\">" + fetch_settings('ToolProxy', params['custom_lti_link_custom_url']) + "</textarea>"
        end
      end

      output += "<br><br>"
      # already filtered
      parameters = request.request_parameters.reject { |k,v| k =~ /^oauth_/ }
      keys = parameters.keys.sort
      for key in keys
        output += "#{key}: #{parameters[key]}<br>\n"
      end
      output += "<br><br>"
      output += "<input type=\"submit\" value=\"Submit\" />"
      output += "</form>"
      render :inline => output
    else
      @tool_deployment = ToolDeployment.find(params['tool_deployment_id'])

      tool_proxy_hash = gather_params('ToolProxy', params['toolproxy'])
      send_put_request('ToolProxy', params['custom_tool_proxy_custom_url'], tool_proxy_hash)

      tool_proxy_binding_hash = gather_params('ToolProxyBinding', params['toolproxybinding'])
      send_put_request('ToolProxy', params['custom_tool_proxy_binding_custom_url'], tool_proxy_binding_hash)

      lti_link_hash = gather_params('LtiLink', params['ltilink'])
      send_put_request('ToolProxy', params['custom_lti_link_custom_url'], lti_link_hash)

      num_updates = tool_proxy_hash.length + tool_proxy_binding_hash.length + lti_link_hash.length
      render :text => "#{num_updates} properties updated"
    end
  end

  private

  def fetch_settings(setting_name, endpoint)
    settings_hash = send_get_request(setting_name, endpoint)
    textarea = ''
    settings_hash.each_pair do |k,v|
      textarea << "\n" unless textarea.length == 0
      textarea << "#{k}=#{v}"
    end
    textarea
  end

  def gather_params(setting_name, setting_string)
    settings_hash = {}
    lines = setting_string.split("\n")
    lines.each do |line|
      m = /^(.*)=(.*)$/.match(line.strip)
      if m.present?
         settings_hash[m[1]]  = m[2]
      end
    end
    settings_hash
  end

  def send_get_request(setting_name, endpoint)
    signed_request = create_signed_request \
      endpoint,
      'GET',
      @tool_deployment.key,
      @tool_deployment.secret,
      {},
      "", "",
      'application/vnd.ims.lti.v2.toolsettings.simple+json'

    puts "Get settings request: #{signed_request.signature_base_string}"
    response = invoke_service(signed_request, Rails.application.config.wire_log, "Get settings for #{setting_name}")
    response_body = response.body
    JSON.load(response_body) unless response_body.strip.empty?
  end

  def send_put_request(setting_name, endpoint, data)
    data = JSON.pretty_generate data
    # data = CGI::escape(data)
    signed_request = create_signed_request \
      endpoint,
      #"PUT",
      #TODO until PUT is fixed on ims server
      "POSt",
      @tool_deployment.key,
      @tool_deployment.secret,
      {},
      data,
      "application/vnd.ims.lti.v2.toolsettings.simple+json"

    puts "Put settings request: #{signed_request.signature_base_string}"
    response = invoke_service(signed_request, Rails.application.config.wire_log, "Put settings for #{setting_name}")
    response_body = response.body
    #JSON.load(response_body) unless response_body.strip.empty?
  end
end