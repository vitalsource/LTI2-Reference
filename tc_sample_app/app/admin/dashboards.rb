ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    if params.has_key? "lti_errormsg"
      div :style => "color: red" do
        span params['lti_errormsg']
      end
    end

    render "dashboard"

  end # content

end
