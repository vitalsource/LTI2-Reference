require 'test_helper'

class TenantUsersControllerTest < ActionController::TestCase
  setup do
    @tenant_user = tenant_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenant_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenant_user" do
    assert_difference('TenantUser.count') do
      post :create, :tenant_user => { :email => @tenant_user.email, :first_name => @tenant_user.first_name, :last_name => @tenant_user.last_name, :tenant_id => @tenant_user.tenant_id, :user_id => @tenant_user.user_id }
    end

    assert_redirected_to tenant_user_path(assigns(:tenant_user))
  end

  test "should show tenant_user" do
    get :show, :id => @tenant_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tenant_user
    assert_response :success
  end

  test "should update tenant_user" do
    put :update, :id => @tenant_user, :tenant_user => { :email => @tenant_user.email, :first_name => @tenant_user.first_name, :last_name => @tenant_user.last_name, :tenant_id => @tenant_user.tenant_id, :user_id => @tenant_user.user_id }
    assert_redirected_to tenant_user_path(assigns(:tenant_user))
  end

  test "should destroy tenant_user" do
    assert_difference('TenantUser.count', -1) do
      delete :destroy, :id => @tenant_user
    end

    assert_redirected_to tenant_users_path
  end
end
