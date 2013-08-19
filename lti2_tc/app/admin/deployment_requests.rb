

ActiveAdmin.register DeploymentRequest do
  menu :parent => "LTI2..."
# 
  # collection_action :method => :post do
    # link_to 'Create Product', {:action => :create_product, :id => deployment_request}
  # end
#   
  # member_action :create_product do
    # @deployment_request = DeploymentRequest.new
    # uuid = UUID.new
    # @deployment_request.tc_profile_guid = uuid.generate
    # @deployment_request.reg_key = uuid.generate
    # @deployment_request.reg_password = SecureRandom.hex
    # @deployment_request.status = "prepared"
    # @deployment_request.save
  # end
  
  action_item :only => :show do
    link_to 'Request Product', {:action => :request_product, :id => deployment_request}
  end

  member_action :request_product do
    tool_consumer_registry = Rails.application.config.tool_consumer_registry
    @deployment_request = DeploymentRequest.find(params[:id])

    html_body = ToolRegistration.register_tool current_admin_user, @deployment_request, 
    				tool_consumer_registry.tool_consumer_profile_wrapper, tool_consumer_registry.tc_deployment_url
    
    render :inline => html_body
  end
  
  index do
    selectable_column
    id_column
    column :partner_url
    column :reg_key
    column :reg_password
    column :status
    default_actions
  end  
  
  form do |f|
    f.inputs "Deployment Proposal" do
      f.input :partner_url, :required => true
      # f.input :id, :input_html => { :readonly => true }
      f.input :reg_key, :input_html => { :readonly => true }
      f.input :reg_password, :input_html => { :readonly => true }
      f.input :status, :input_html => { :readonly => true }
      f.input :tc_profile_guid, :input_html => { :readonly => true }
      # etc
    end
    f.buttons
  end
  
end
