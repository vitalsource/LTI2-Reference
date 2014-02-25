require 'test_helper'

class DeploymentProposalsControllerTest < ActionController::TestCase
  setup do
    @deployment_proposal = deployment_proposals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deployment_proposals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deployment_proposal" do
    assert_difference('DeploymentProposal.count') do
      post :create, :deployment_proposal => { :launch_presentation_return_url => @deployment_proposal.launch_presentation_return_url, :reg_key => @deployment_proposal.reg_key, :reg_password => @deployment_proposal.reg_password, :status => @deployment_proposal.status, :tc_profile_url => @deployment_proposal.tc_profile_url, :tenant_key => @deployment_proposal.tenant_key, :tenant_name => @deployment_proposal.tenant_name, :user_id => @deployment_proposal.user_id }
    end

    assert_redirected_to deployment_proposal_path(assigns(:deployment_proposal))
  end

  test "should show deployment_proposal" do
    get :show, :id => @deployment_proposal
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @deployment_proposal
    assert_response :success
  end

  test "should update deployment_proposal" do
    put :update, :id => @deployment_proposal, :deployment_proposal => { :launch_presentation_return_url => @deployment_proposal.launch_presentation_return_url, :reg_key => @deployment_proposal.reg_key, :reg_password => @deployment_proposal.reg_password, :status => @deployment_proposal.status, :tc_profile_url => @deployment_proposal.tc_profile_url, :tenant_key => @deployment_proposal.tenant_key, :tenant_name => @deployment_proposal.tenant_name, :user_id => @deployment_proposal.user_id }
    assert_redirected_to deployment_proposal_path(assigns(:deployment_proposal))
  end

  test "should destroy deployment_proposal" do
    assert_difference('DeploymentProposal.count', -1) do
      delete :destroy, :id => @deployment_proposal
    end

    assert_redirected_to deployment_proposals_path
  end
end
