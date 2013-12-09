module Lti2Tc
  class ToolConsumerRegistry

    attr_reader :tool_consumer_profile, :tc_deployment_url, :relaxed_oauth_check, :result_template,
                :tool_consumer_name, :registry, :tool_consumer_profile_wrapper

          def initialize
      registry_entries = Registry.all
      @registry = {}
      registry_entries.each { |entry| @registry[entry.name] = entry.content unless entry.name == 'content' }

      @tc_deployment_url = registry['tc_deployment_url']
      @relaxed_oauth_check = registry['relaxed_oauth_check']
      @result_template = registry['result_template']
      @tool_consumer_name = registry['tool_consumer_name']

      # gets tcp root and returns as a json_object (optimizes successive accesses to tcp)
      tcp = Lti2Commons::JsonWrapper.new registry['tool_consumer_profile_template']
      tcp.substitute_text_in_all_nodes '{', '}', registry
      @tool_consumer_profile_wrapper = tcp
      @tool_consumer_profile = tcp.root
          end
  end
end