module Lti2Tp

  class ToolProviderRegistry

    attr_reader :security_contract_template, :tp_deployment_url, :relaxed_oauth_check, :result_template,
                :tool_provider_name, :registry

    def initialize
      registry_entries = Registry.all()
      @registry = {}
      registry_entries.each { |entry| @registry[entry.name] = entry.content unless entry.name == 'content' }

      @tp_deployment_url = ENV['TP_DEPLOYMENT_URL']
      if @tp_deployment_url.blank?
        @tp_deployment_url = registry['tp_deployment_url'] if registry.has_key? 'tp_deployement_url'
        if @tp_deployment_url.blank?
          hostname = Socket.gethostname
          port = ":#{Rails::Server.new.options[:Port]}" if defined? Rails::Server
          @tp_deployment_url = "http://#{hostname}#{port}"
        end
      end
      Rails.logger.warn "tp_deployment_url: #{@tp_deployment_url}"
      # replace loaded value with derived
      @registry['tp_deployment_url'] = @tp_deployment_url

      @relaxed_oauth_check = registry['relaxed_oauth_check']
      @result_template = registry['result_template']
      @tool_provider_name = registry['tool_provider_name']
    end
  end

end