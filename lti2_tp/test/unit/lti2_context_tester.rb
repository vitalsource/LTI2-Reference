require File.expand_path('../../../test/test_helper', __FILE__)

class Lti2ContextTester < ActiveSupport::TestCase

  def setup
    @session = {}
  end

  def test_blank_holder
    lti2_context = LtiContextHolder.new()
    puts lti2_context.inspect
  end

  #ARGV = ['', "--name", "test_expired_timestamp"]
  #Test::Unit::AutoRunner.run(false, nil, ARGV)
end