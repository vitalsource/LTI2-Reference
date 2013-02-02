 
require "rubygems"
require "httparty"

module Lti2Commons

  # Module to support LTI 1 and 2 secure messaging.
  # This messaging is documented in the LTI 2 Security Document
  # 
  # LTI 2 defines two types of LTI secure messaging:
  #   1. LTI Messages
  #     This is the model used exclusively in LTI 1.
  #     It is also used in LTI 2 for user-submitted actions such as LtiLaunch and ToolDeployment.
  #   
  #     It works the following way:
  #       1. LTI parameters are signed by OAuth.
  #       2. The message is marshalled into an HTML Form with the params
  #          specified in form fields.
  #       3. The form is sent to the browser with a redirect.
  #       4. An attached Javascript script 'auto-submits' the form.
  # 
  #     This structure appears to the Tool Provider as a user submission with all user browser context
  #     intact.
  #
  #   2. LTI Services
  #     This is a standard REST web service with OAuth message security added.
  #     In LTI 2.0 Services are only defined for Tool Provider --> Tool Consumer services;
  #     such as, GetToolConsumerProfile, RegisterToolProxy, and LTI 2 Outcomes.
  #     LTI 2.x will add Tool Consumer --> Tool Provider services using the same machinery.
  #
  module MessageSupport

    # Convenience method signs and then invokes create_lti_message_from_signed_request
    #
    # @params launch_url [String] Launch url
    # @params parameters [Hash] Full set of params for message 
    # @return [String] Post body ready for use
    def create_lti_message_body(launch_url, parameters, wire_log=nil, title=nil)
      result = create_message_header(launch_url)
      result += create_message_body parameters
      result += create_message_footer
      
      if wire_log
        wire_log.timestamp
        wire_log.raw_log((title.nil?) ? "LtiMessage" : "LtiMessage: #{title}")
        wire_log.raw_log "LaunchUrl: #{launch_url}"
        wire_log.raw_log result.strip
        wire_log.newline
        wire_log.flush
      end
      result
    end
    
    # Creates an LTI Message (POST body) ready for redirecting to the launch_url.
    # Note that the is_include_oauth_params option specifies that 'oauth_' params are 
    # included in the body.  This option should be false when sender is putting them in the
    # HTTP Authorization header (now recommended).
    #
    # @param params [Hash] Full set of params for message (including OAuth provided params)
    # @return [String] Post body ready for use
    def create_lti_message_body_from_signed_request(signed_request, is_include_oauth_params=true)
      result = create_message_header(signed_request.uri)
      result += create_message_body signed_request.parameters, is_include_oauth_params
      result += create_message_footer
      result
    end

    # Invokes an LTI Service. 
    # This is fully-compliant REST request suitable for LTI server-to-server services.
    #
    # @param request [Request] Signed Request encapsulates everything needed for service.
    def invoke_service(request, wire_log=nil, title=nil)
      uri = request.uri.to_s
      method = request.method.downcase
      headers = {}
      headers['Authorization'] = request.oauth_header
      if ['post','put'].include? method
        headers['Content-Type'] = request.content_type if request.content_type
        headers['Content-Length'] = request.body.length.to_s if request.body
      end

      parameters = request.parameters
      # need filtered params here
        
      output_parameters = {}
      (write_wirelog_header wire_log, title, request.method, uri, headers, request.parameters, request.body, output_parameters) if wire_log
      
      full_uri = uri
      full_uri += '?' unless uri.include? "?"
      full_uri += '&' unless full_uri =~ /[?&]$/
      output_parameters.each_pair do |key, value|
        full_uri << '&' unless key == output_parameters.keys.first
        full_uri << "#{URI.encode(key.to_s)}=#{URI.encode(output_parameters[key])}"
      end

      case request.method.downcase
      when "get"
        response = HTTParty.get full_uri, :headers => headers
      when "post"
        response = HTTParty.post full_uri, :body => request.body, :headers => headers
      when "put"
        response = HTTParty.put full_uri, :body => request.body, :headers => headers
      when "delete"
        response = HTTParty.delete full_uri, :headers => headers
      end
      wire_log.log_response response, title if wire_log
      response
    end
    
    def invoke_unsigned_service uri, method, params={}, headers={}, data=nil, wire_log=nil, title=nil
      full_uri = uri
      full_uri += '?' unless uri.include? "?"
      full_uri += '&' unless full_uri =~ /[?&]$/
      params.each_pair do |key, value|
        full_uri << '&' unless key == params.keys.first
        full_uri << "#{URI.encode(key.to_s)}=#{URI.encode(params[key])}"
      end

      (write_wirelog_header wire_log, title, method, uri, headers, params, data, {}) if wire_log
      
      case method
      when "get"
        response = HTTParty.get full_uri, :headers => headers, :timeout => 120
      when "post"
        response = HTTParty.post full_uri, :body => data, :headers => headers, :timeout => 120
      when "put"
        response = HTTParty.put full_uri, :body => data, :headers => headers, :timeout => 120
      when "delete"
        response = HTTParty.delete full_uri, :headers => headers, :timeout => 120
      end     
      wire_log.log_response response, title if wire_log
      response
    end    
    
    private

    
    def create_message_header(launch_url)
      %Q{
<div id="ltiLaunchFormSubmitArea">
  <form action="#{launch_url}"
    name="ltiLaunchForm" id="ltiLaunchForm" method="post"
    encType="application/x-www-form-urlencoded"
    target="_blank">
}
    end
    
    def create_message_body(params, is_include_oauth_params=true)
      result = ""
      params.each_pair do |k,v|
        if is_include_oauth_params || ! (k =~ /^oauth_/)
          result += 
            %Q{      <input type="hidden" name="#{k}" value="#{v}"/>\n}          
        end
      end
      result
    end
    
    def create_message_footer
      %Q{  </form>
</div>
<script language="javascript">
  document.ltiLaunchForm.submit(); 
</script>        
      }
    end

    def set_http_headers(http, request)
      http.headers['Authorization'] = request.oauth_header
      http.headers['Content-Type'] = request.content_type if request.content_type
      http.headers['Content-Length'] = request.body.length if request.body
    end
    
    def write_wirelog_header wire_log, title, method, uri, headers={}, parameters={}, body=nil, output_parameters={}
      wire_log.timestamp
      wire_log.raw_log((title.nil?) ? "LtiService" : "LtiService: #{title}")
      wire_log.raw_log "#{method.upcase} #{uri}"
      unless headers.blank?
        wire_log.raw_log "Headers:"
        headers.each { |k,v| wire_log.raw_log "#{k}: #{v}" }
      end
      parameters.each { |k,v| output_parameters[k] = v unless k =~ /^oauth_/ }

      if output_parameters.length > 0
        wire_log.raw_log "Parameters:"
        output_parameters.each { |k,v| wire_log.raw_log "#{k}: #{v}" }
      end
      if body
        wire_log.raw_log "Body:"
        wire_log.raw_log body
      end
      wire_log.newline
      wire_log.flush
    end
            
  end
end