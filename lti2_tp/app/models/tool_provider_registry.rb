
class ToolProviderRegistry

  attr_reader :security_contract_template, :tp_deployment_url, :relaxed_oauth_check, :result_template, 
              :tool_provider_name, :registry
	
	def initialize
    registry_entries = Registry.find(:all)
    @registry = {}
    registry_entries.each { |entry| @registry[entry.name] = entry.content unless entry.name == 'content' }
    
    @tp_deployment_url = registry['tp_deployment_url']
    @relaxed_oauth_check = registry['relaxed_oauth_check']
    @result_template = registry['result_template']
    @tool_provider_name = registry['tool_provider_name']
    @security_contract_template = registry['security_contract_template']

	end
	
end