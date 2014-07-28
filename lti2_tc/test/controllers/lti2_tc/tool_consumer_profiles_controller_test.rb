require 'test_helper'

module Lti2Tc
  class ToolConsumerProfilesControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

    test "should get show" do
      get :show
      assert_response :success
    end

  end
end
