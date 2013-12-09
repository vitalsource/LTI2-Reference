require "test/unit"
require File.expand_path('../../../test/test_helper', __FILE__)

class TestRoles < Test::Unit::TestCase
  def setup
  end
  
  def test_tool_consumer_profile
    tcp = Rails.application.config.tool_consumer_registry.tool_consumer_profile
    puts tcp
  end
end
