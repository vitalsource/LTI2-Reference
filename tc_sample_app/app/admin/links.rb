


ActiveAdmin.register Lti2Tc::Link do
  menu :parent => "LTI..."
      
  action_item :only => :show do
    link_to 'LTI2 Launch', {:action => :lti2_launch}
  end

  member_action :lti2_launch do
    link = Lti2Tc::Link.find(params[:id])
    render :inline => link.lti_launch(current_admin_user, "/admin/links") 
  end
    
end


