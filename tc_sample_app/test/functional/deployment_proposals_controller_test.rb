require 'test_helper'

class DeploymentRequestsControllerTest < ActionController::TestCase
  setup do
    @deployment_request = deployment_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deployment_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deployment_request" do
    assert_difference('DeploymentRequest.count') do
      post :create, :deployment_request => {  }
    end

    assert_redirected_to deployment_request_path(assigns(:deployment_request))
  end

  test "should show deployment_request" do
    get :show, :id => @deployment_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @deployment_request
    assert_response :success
  end

  test "should update deployment_request" do
    put :update, :id => @deployment_request, :deployment_request => {  }
    assert_redirected_to deployment_request_path(assigns(:deployment_request))
  end

  test "should destroy deployment_request" do
    assert_difference('DeploymentRequest.count', -1) do
      delete :destroy, :id => @deployment_request
    end

    assert_redirected_to deployment_requests_path
  end
end
