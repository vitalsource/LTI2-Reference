ActiveAdmin.register Tool do
  menu :parent => "LTI2..."
  
  action_item :only => :show do
    link_to 'Reregister', {:action => :reregister}
  end

  member_action :reregister do
    deployment_request = DeploymentRequest.new   
    tool = Tool.find(params[:id])
    tool_consumer_registry = Rails.application.config.tool_consumer_registry
    tool_consumer_profile = ToolConsumerProfile.new
    tc_profile_str = tool_consumer_registry.tool_consumer_profile
    tc_deployment_url = tool_consumer_registry.tc_deployment_url
    
    html_body = ToolRegistration::reregister_tool current_admin_user, deployment_request, 
                    tool, tool_consumer_profile_wrapper, tc_profile_str, tc_deployment_url,
                    "#{tc_deployment_url}/admin/tool_actions"   
                     
    render :inline => html_body

  end

  index do
    selectable_column
    id_column
    column :is_enabled
    column :product_name
    column :description
    column :key
    column :secret
    default_actions
  end  

end
