
require "test/unit"
require "rubygems"
require 'json'
require 'jsonpath'

class TestTree < Test::Unit::TestCase
  def setup
    @json_str =
<<PROXY
{
  "@context" : [
      "http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolProxy",
      "http://purl.org/blackboard/ctx/v1/iconStyle"
  ],
  "@type" : "ToolProxy",
  "@id" : "http://fabericious..com/ToolProxy/869e5ce5-214c-4e85-86c6-b99e8458a592",
  "lti_version" : "LTI-2p0",
  "tool_proxy_guid" : "869e5ce5-214c-4e85-86c6-b99e8458a592",
  "tool_consumer_profile" : "http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4",
  "tool_profile" : {
    "lti_version" : "LTI-2p0",
    "product_instance" : {
      "guid" : "fd75124a-140e-470f-944c-114d2d92bb40",
      "product_info" : {
        "product_name" : {
          "default_value" : "Acme Assessments",
          "key" : "tool.name"
        },
        "description" : {
          "default_value" : "Acme Assessments provide an interactive test format.",
          "key" : "tool.description"
        },
        "product_version" : "10.3",
        "technical_description" : {
          "default_value" : "Support provided for all LTI 1 extensions as well as LTI 2",
          "key" : "tool.technical"
        },
        "product_family" : {
          "code" : "assessment-tool",
          "vendor" : {
            "code" : "acme.com",
            "name" : {
              "default_value" : "Acme",
              "key" : "tool.vendor.name"
            },
            "description" : {
              "default_value" : "Acme is a leading provider of interactive tools for education",
              "key" : "tool.vendor.description"
            },
            "website" : "http://acme.example.com",
            "timestamp" : "2012-04-05T09:08:16-04:00",
            "contact" : {
              "email" : "info@example.com"
            }
          }
        }
      },
      "support" : {
        "email" : "helpdesk@example.com"
      },
      "service_provider" : {
        "guid" : "18e7ea50-3d6d-4f6b-aff2-ed3ab577716c",
        "provider_name" : {
          "default_value" : "Acme Hosting",
          "key" : "service_provider.name"
        },
        "description" : {
          "default_value" : "Provider of high performance managed hosting environments",
          "key" : "service_provider.description"
        },
        "support" : {
          "email" : "support@acme-hosting.example.com"
        },
        "timestamp" : "2012-04-05T09:08:16-04:00"
      }
    },
    "base_url_choice" : [
       { "default_base_url" : "http://acme.example.com",
         "secure_base_url" : "https://acme.example.com",
         "selector" : {
           "applies_to" : [
             "IconEndpoint",
             "MessageHandler"
           ]
         }
       }
     ],
    "resource_handler" : [
      { 
        "name" : {
          "default_value" : "Acme Assessment",
          "key" : "assessment.resource.name"
        },
        "description" : {
          "default_value" : "An interactive assessment using the Acme scale.",
          "key" : "assessment.resource.description"
        },
        "message" : { 
          "message_type" : "basic-lti-launch-request",
          "path" : "/handler/launchRequest",
          "capability" : [
            "Result.autocreate",
            "Result.sourcedGUID"
          ],
          "parameter" : [
            { "name" : "result_id",
              "variable" : "$Result.sourcedGUID"
            },
            { "name" : "discipline",
              "fixed" : "chemistry"
            }
          ]
        },
        "icon_info" : [
           {   
             "default_location" : {
               "path" : "/images/bb/en/icon.png"
             },
             "key" : "iconStyle.default.path"
           },
           { "icon_style" : "BbListElementIcon",
             "default_location" : {
               "path" : "/images/bb/en/listElement.png"
             },
             "key" : "iconStyle.bb.listElement.path"
           },
           { "icon_style" : "BbPushButtonIcon",
             "default_location" : {
               "path" : "images/bb/en/pushButton.png"
             },
             "key" : "iconStyle.bb.pushButton.path"
           }
         ]
      }
    ]
  },
  "security_contract" : {
    "shared_secret" : "ThisIsASecret!",
    "tool_service" : [
      { "@type" : "RestServiceProfile",
        "service" : "http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection",
        "action" : "POST"
      },
      { "@type" : "RestServiceProfile",
        "service" : "http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item",
        "action" : [
          "GET",
          "PUT"
        ]
      },
      { "@type" : "RestService",
        "service" : "http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item",
        "action" : [
          "GET",
          "PUT"
        ]
      }      
    ]
  }
}
PROXY

  @json_obj = JSON.parse(@json_str)
  end
  
  # asserts if expected_value is provided, else prints result
  # useful for preparing new tests
  def assert_node(jsonpath, expected_value=nil)
    try_result = JsonPath.new(jsonpath).on(@json_obj)
    if expected_value
      assert_equal expected_value, try_result
    else
      puts "#{jsonpath}: #{try_result.inspect}"
    end
  end  
  
  # asserts if singleton expected_value is provided, else prints result
  # useful for preparing new tests
  def assert_first(jsonpath, expected_value=nil)
    try_result = JsonPath.new(jsonpath).on(@json_obj).first
    if expected_value
      assert_equal expected_value, try_result
    else
      puts "#{jsonpath}: #{try_result.inspect}"
    end
  end
  
  def test_path_on_json
    # Note that same result for JSON string or loaded JSON object 
    assert_equal ["869e5ce5-214c-4e85-86c6-b99e8458a592"], JsonPath.new('tool_proxy_guid').on(@json_str)
    assert_equal ["869e5ce5-214c-4e85-86c6-b99e8458a592"], JsonPath.new('tool_proxy_guid').on(@json_obj)
    # assert_node 'tool_proxy_guid'
    assert_node 'tool_proxy_guid', ["869e5ce5-214c-4e85-86c6-b99e8458a592"]
  end
  
  def test_first
    assert_equal "869e5ce5-214c-4e85-86c6-b99e8458a592", JsonPath.new('tool_proxy_guid').on(@json_str).first
  end
  
  def test_basics
    assert_node 'tool_proxy_guid', ["869e5ce5-214c-4e85-86c6-b99e8458a592"]
    assert_node 'security_contract.shared_secret', ["ThisIsASecret!"]
    # 2 dots goes through array(s)
    assert_node 'tool_profile.base_url_choice..default_base_url', ["http://acme.example.com"]
    assert_node 'lti_version', ["LTI-2p0"]
  end
  
  def test_arrays
    assert_node "tool_profile.resource_handler[0].message.path", ["/handler/launchRequest"]
    assert_node 'tool_profile.resource_handler[0].message.message_type', ["basic-lti-launch-request"]
  end
  
  def test_filter0
    # resource_handler = JsonPath.new('tool_profile.resource_handler').on(@json_obj)
    # assert_node 'tool_profile.resource_handler[?(true)]'
    # assert_node 'tool_profile.resource_handler.[?(@["message"]["message_type"]=="basic-lti-launch-request")]'
    #find matching message_type and dig down to get message.path
    assert_equal "/handler/launchRequest", 
      JsonPath.new('tool_profile.resource_handler.[?(@["message"]["message_type"]=="basic-lti-launch-request")]').on(@json_obj).first['message']['path']
    
    # do the same replying JsonPath
    assert_equal "/handler/launchRequest", JsonPath.new('@..message..path').on(
      JsonPath.new('tool_profile.resource_handler.[?(@["message"]["message_type"]=="basic-lti-launch-request")]').on(@json_obj)).first
    
  end
  
  def test_filter
    assert_first 'security_contract.tool_service[0].action', "POST"
    assert_first 'security_contract.tool_service[?(@["action"]=="POST")]', 
      {"service"=>"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection", "action"=>"POST", "@type"=>"RestServiceProfile"}
    # assert_first 'security_contract.tool_service[?(@["action"]=="POST")]'
    assert_equal "POST", JsonPath.new('security_contract.tool_service[?(@["action"]=="POST")]').on(@json_obj).first['action']
  end
  
  def test_enumerate
    enum = JsonPath.new("$..*")[@json_obj]
    counter = 0
    enum.each {|node| counter += 1}
    assert_equal 114, counter
  end
  
  def test_enumerate
    root = JsonPath.new("$").on(@json_str).first
    assert_equal ["http://acme.example.com"], JsonPath.new('tool_profile.base_url_choice..default_base_url').on(root)
  end
    
  def test_print
    root = JsonPath.new("$").on(@json_str).first
    # puts root.to_json
    puts JSON.pretty_generate root
  end
  
  ARGV = ['', "--name", "test_print"]
  Test::Unit::AutoRunner.run(false, nil, ARGV)
end
