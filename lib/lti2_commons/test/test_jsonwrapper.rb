require "test/unit"
require "rubygems"
require 'json'
require 'jsonpath'

require File.expand_path('../../lib/lti2_commons/json_wrapper', __FILE__)
require File.expand_path('../../lib/lti2_commons/utils', __FILE__)

include Lti2Commons
include Utils

class TestJsonWrapper < Test::Unit::TestCase
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
       "resource_type": "urn:lti:ResourceType:{fabericious.lti.org}/handler/launchRequest",
        "name" : {
          "default_value" : "Acme Assessment",
          "key" : "assessment.resource.name"
        },
        "description" : {
          "default_value" : "An interactive assessment using the Acme scale.",
          "key" : "assessment.resource.description"
        },
        "message" : [{
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
        }],
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

  @json_wrapper = JsonWrapper.new @json_str
  end

  def test_constuctor
    assert_not_nil @json_wrapper.root
  end

  def test_at
    assert_equal ["869e5ce5-214c-4e85-86c6-b99e8458a592"], @json_wrapper.at('tool_proxy_guid')
  end

  def test_first_at
    assert_equal "869e5ce5-214c-4e85-86c6-b99e8458a592", @json_wrapper.first_at('tool_proxy_guid')
    assert_nil @json_wrapper.first_at('asdf')
  end

  def test_each_leaf
    counter = 0
    @json_wrapper.each_leaf { |node| counter += 1 }
    assert_equal 70, counter
  end

  def test_deep_copy
    new_json_wrapper = @json_wrapper.deep_copy
    assert_not_equal new_json_wrapper.object_id, @json_wrapper.object_id
    assert_equal "869e5ce5-214c-4e85-86c6-b99e8458a592", new_json_wrapper.first_at('tool_proxy_guid')
  end

  def test_search
    assert_equal "/handler/launchRequest",
        ( @json_wrapper.search 'tool_profile.resource_handler..message',
            { 'message_type' => "basic-lti-launch-request" },
            "path")
    assert_nil @json_wrapper.search 'tool_profile.resource_handler..message',
            { 'message_type' => "basic-lti-launch-request" },
            "xxxx"
    assert_nil @json_wrapper.search 'tool_profile.resource_handler..message',
            { 'message_type' => "xxx" },
            "path"
  end

  def test_select
    assert_equal "http://acme.example.com",
        @json_wrapper.select('tool_profile.base_url_choice',
            "selector.applies_to", "MessageHandler", 'default_base_url')
    assert_equal nil, @json_wrapper.select('tool_profile.xxxxx',
            "selector.applies_to", "MessageHandler", 'default_base_url')
  end

  def test_each_deep_with_substitution
    hash = {"root" => {"child1" => "{value}1", "child2" => {"grandchild1" => "{grand}{value}1"}, "child3" => "{value}3"}}
    json_hash = JsonWrapper.new hash
    subst_hash = {'value' => 'VLU', 'great' => 'GRT', 'grand' => 'GRND'}
    json_hash.substitute_text_in_all_nodes '{', '}', subst_hash
    assert_equal "VLU1", json_hash.first_at('$..child1')
    assert_equal "GRNDVLU1", json_hash.first_at('$..grandchild1')
  end

  ARGV = ['', "--name", "test_select"]
  # Test::Unit::AutoRunner.run(false, nil, ARGV)
end