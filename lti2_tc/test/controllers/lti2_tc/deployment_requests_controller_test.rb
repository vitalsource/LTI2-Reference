require 'test_helper'

module Lti2Tc
  class DeploymentRequestsControllerTest < ActionController::TestCase
    test "should get show" do
      get :show
      assert_response :success
    end

  end
end
