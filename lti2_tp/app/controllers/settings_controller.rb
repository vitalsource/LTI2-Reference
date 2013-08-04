class SettingsController < ApplicationController
  def create
    oauth_consumer_key = params['oauth_consumer_key']
    if oauth_consumer_key.present?
      logger.info "PrePreProcessTenant"
      (status, message, message_key) = pre_process_tenant

      output = "<h2>Settings Tool</h2><br>\n"
      return_url = request.request_parameters['launch_presentation_return_url']
      output += "<form method=\"POST\">"
      output += "<h3>ToolProxy Settings</h3>"
      output += "<textarea cols=\"40\" rows=\"5\" name=\"toolproxy\">#{fetch_settings('custom_tool_proxy_custom_url')}</textarea>"
      output += "<h3>ToolProxyBinding Settings</h3>"
      output += "<textarea cols=\"40\" rows=\"5\" name=\"toolproxybinding\">#{fetch_settings('custom_tool_proxy_binding_custom_url')}</textarea>"
      output += "<h3>LtiLink Settings</h3>"
      output += "<textarea cols=\"40\" rows=\"5\" name=\"ltilink\">#{fetch_settings('custom_lti_link_custom_url')}</textarea>"
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
      save_request_parameters_to_flash
      render :inline => output
    else
      tool_proxy_hash = gather_params('ToolProxy', params['toolproxy'])
      tool_proxy_binding_hash = gather_params('ToolProxyBinding', params['toolproxybinding'])
      lti_link_hash = gather_params('LtiLink', params['ltilink'])
    end
  end

  private

  def fetch_settings(s)s

  end

  def send_get_request(setting_name, endpoint)
    signed_request = create_signed_request \
      endpoint,
      'GET',
      @deployment_proposal.key,
      @deployment_proposal.secret,
      {}

    puts "Get settings request: #{signed_request.signature_base_string}"
    response = invoke_service(signed_request, Rails.application.config.wire_log, "Get settings for #{setting_name}")
    response_body = response.body
    JSON.load(response_body) unless response_body.strip.empty?
  end

  def send_put_request(setting_name, endpoint, data)
    data = JSON.pretty_generate tool_proxy
    # data = CGI::escape(data)
    signed_request = create_signed_request \
      endpoint,
      method,
      @deployment_proposal.key,
      @deployment_proposal.secret,
      {},
      data,
      "application/vnd.ims.lti.v2.ToolSettings+json,application/vnd.ims.lti.v2.ToolSettings.simple+json"

    puts "Put settings request: #{signed_request.signature_base_string}"
    response = invoke_service(signed_request, Rails.application.config.wire_log, "Put settings for #{setting_name}")
    response_body = response.body
    JSON.load(response_body) unless response_body.strip.empty?
  end
end