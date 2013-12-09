require 'test_helper'

module Lti2Tc
  class ToolSettingsControllerControllerTest < ActionController::TestCase
    test "should get show" do
      get :show
      assert_response :success
    end

    test "should get update" do
      get :update
      assert_response :success
    end

  end
end
