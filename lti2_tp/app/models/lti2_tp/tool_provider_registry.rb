module Lti2Tp

  class ToolProviderRegistry

    attr_reader :security_contract_template, :tp_deployment_url, :relaxed_oauth_check, :result_template,
      :tool_provider_name, :registry

    def initialize
      registry_entries = [
        OpenStruct.new(name: 'tp_deployment_url', content: 'http://localhost:3000'),
        OpenStruct.new(name: 'security_contract_template', content: security_contract_template),
        OpenStruct.new(name: 'relaxed_oauth_check', content: 'false'),
        OpenStruct.new(name: 'result_template', content: result_template),
        OpenStruct.new(name: 'tool_provider_name', content: 'Fabericious'),
        OpenStruct.new(name: 'wirelog_filename', content: '/tmp/wirelog.html'),
      ]

      @registry = {}
      registry_entries.each {|entry| @registry[entry.name] = entry.content unless entry.name == 'content'}

      @tp_deployment_url = registry['tp_deployment_url']
      @relaxed_oauth_check = registry['relaxed_oauth_check']
      @result_template = registry['result_template']
      @tool_provider_name = registry['tool_provider_name']
    end

    def security_contract_template
      <<-text
{ "shared_secret" : "{aSecret}",
  "tool_service" : [ {
	"@id": ":ToolProxy.collection",
	"@type" : "RestServiceProfile",
        "action" : "POST",
        "service" : "http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection"
      },
      {
	"@id": ":ToolProxy.item",
	"@type" : "RestServiceProfile",
        "action" : [ "GET",
            "PUT"
          ],
        "service" : "http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item"
      },
      {
	"@id": ":ToolProxy.collection",
	"@type" : "RestService",
        "action" : [ "GET",
            "PUT"
          ],
        "service" : "http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item"
      }
    ]
}
      text
    end

    def result_template
      <<-text
{
  "@context" : "http://www.imsglobal.org/imspurl/lis/v2/ctx/Result",
  "@type" : "Result",
  "resultScore" : {
    "@type" : "decimal",
    "@value"  : {value}
  }
}
      text
    end

  end

end