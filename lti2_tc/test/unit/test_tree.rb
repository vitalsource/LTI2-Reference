
require "rubygems"
require "json"
require "tree"
require "test/unit"

require File.expand_path('../../../test/test_helper', __FILE__)

class TestTree < Test::Unit::TestCase
  def setup
    @tcp_str = Registry.get_tool_consumer_registry['tool_consumer_profile']
  end
  
  def test_load
    json_hash = JSON.parse(@tcp_str)
    root_hash = {'name' => json_hash }
    tcp = Tree::TreeNode.json_create(root_hash)
    tcp.print_tree
  end
  
  # ARGV = ['', "--name", "test_dump"]
  # Test::Unit::AutoRunner.run(false, nil, ARGV)
end
