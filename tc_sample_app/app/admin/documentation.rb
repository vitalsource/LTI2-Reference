ActiveAdmin.register_page "Documentation" do
  menu :label => "Admin Actions", :parent => "LTI..."

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    if params.has_key? "lti_errormsg"
      div :style => "color: red" do
        span params['lti_errormsg']
      end
    end

    render "documentation"

  end # content

end
