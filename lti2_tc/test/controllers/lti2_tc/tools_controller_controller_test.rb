require 'test_helper'

module Lti2Tc
  class ToolsControllerControllerTest < ActionController::TestCase
    test "should get create" do
      get :create
      assert_response :success
    end

    test "should get show" do
      get :show
      assert_response :success
    end

  end
end
