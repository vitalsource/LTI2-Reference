require 'test_helper'

module Lti2Tc
  class ToolProxiesControllerControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

  end
end
