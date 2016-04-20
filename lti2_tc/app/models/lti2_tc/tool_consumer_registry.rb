module Lti2Tc
  class ToolConsumerRegistry

    attr_reader :tool_consumer_profile, :tc_deployment_url, :relaxed_oauth_check, :result_template,
                    :tool_consumer_name, :registry, :tool_consumer_profile_wrapper
                    
    def initialize
      registry_entries = Registry.all
      @registry = {}
      registry_entries.each { |entry| @registry[entry.name] = entry.content unless entry.name == 'content' }

      @tc_deployment_url = ENV['TC_DEPLOYMENT_URL']
      if @tc_deployment_url.blank?
        @tc_deployment_url = registry['tc_deployment_url'] if registry.has_key? 'tp_deployement_url'
        if @tc_deployment_url.blank?
          hostname = Socket.gethostname
          port = ":#{Rails::Server.new.options[:Port]}" if defined? Rails::Server
          @tc_deployment_url = "http://#{hostname}#{port}"
        end
      end
      Rails.logger.warn "tc_deployment_url: #{@tc_deployment_url}"
      # replace loaded value with derived
      @registry['tc_deployment_url'] = @tc_deployment_url
      
      @relaxed_oauth_check = registry['relaxed_oauth_check']
      @result_template = registry['result_template']
      @tool_consumer_name = registry['tool_consumer_name']

      # gets tcp root and returns as a json_object (optimizes successive accesses to tcp)
      tcp = Lti2Commons::JsonWrapper.new registry['tool_consumer_profile_template']
      tcp.substitute_text_in_all_nodes '{', '}', @registry
      @tool_consumer_profile_wrapper = tcp
      @tool_consumer_profile = tcp.root
    end
  end
end
