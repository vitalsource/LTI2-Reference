require 'rake'

ActiveAdmin.register_page "Admin Actions" do
  menu :label => "Admin Actions", :parent => "LMS..."

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    if params.has_key? 'lti_errormsg'
      div :style => "color: red" do
        span params['lti_errormsg']
      end
    end

    if params['operation'] == 'resetdemo'
      # Rake::Task['init_task:all'].execute
      system('rake init_task:all')
    elsif params['operation'] == "clearlog"
      Rails.application.config.wire_log.clear_log
    end

    render 'admin_actions'

  end # content

end
