require 'test_helper'

class ToolDeploymentsControllerTest < ActionController::TestCase
  setup do
    @tool_deployment = tool_deployments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tool_deployments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tool_deployment" do
    assert_difference('ToolDeployment.count') do
      post :create, :tool_deployment => { :product_name => @tool_deployment.product_name, :tenant_id => @tool_deployment.tenant_id, :tool_id => @tool_deployment.tool_id, :tool_proxy => @tool_deployment.tool_proxy }
    end

    assert_redirected_to tool_deployment_path(assigns(:tool_deployment))
  end

  test "should show tool_deployment" do
    get :show, :id => @tool_deployment
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tool_deployment
    assert_response :success
  end

  test "should update tool_deployment" do
    put :update, :id => @tool_deployment, :tool_deployment => { :product_name => @tool_deployment.product_name, :tenant_id => @tool_deployment.tenant_id, :tool_id => @tool_deployment.tool_id, :tool_proxy => @tool_deployment.tool_proxy }
    assert_redirected_to tool_deployment_path(assigns(:tool_deployment))
  end

  test "should destroy tool_deployment" do
    assert_difference('ToolDeployment.count', -1) do
      delete :destroy, :id => @tool_deployment
    end

    assert_redirected_to tool_deployments_path
  end
end
