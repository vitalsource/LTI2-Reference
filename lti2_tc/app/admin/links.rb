


ActiveAdmin.register Link do
  menu :parent => "LMS..."
      
  action_item :only => :show do
    link_to 'LTI2 Launch', {:action => :lti2_launch}
  end

  member_action :lti2_launch do
    link = Link.find(params[:id])
    render :inline => link.lti_launch(current_admin_user, "/admin/links") 
  end
    
end


