class EchoesController < ApplicationController
  before_filter :pre_process_tenant
  
  def create
    output = "<h2>Echo Tool</h2><br><br>\n"
    return_url = request.request_parameters['launch_presentation_return_url']
    output += "<form method=\"GET\">"
    # already filtered
    parameters = request.request_parameters.reject { |k,v| k =~ /^oauth_/ }
    keys = parameters.keys.sort
    for key in keys
      output += "#{key}: #{parameters[key]}<br>\n"
    end
    output += "<br><br>"
    output += "<input type=\"submit\" onclick=\"window.location.href='#{return_url}';return false\" value=\"Submit\" />"
    output += "</form>"
    save_request_parameters_to_flash
    render :inline => output
  end
end