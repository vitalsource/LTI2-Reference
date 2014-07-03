ActiveAdmin.register_page 'Course Actions' do
  menu :label => 'Course Actions', :parent => 'LMS...'

  content :title => proc{ I18n.t('active_admin.dashboard') } do
    if params.has_key? 'lti_errormsg'
      div :style => "color: red" do
        span params['lti_errormsg']
      end
    end

    role = current_admin_user.role
    if role.downcase == 'administrator'
      courses = Course.order( 'course_label' )
    else
      enrollments = Enrollment.where( :admin_user_id => current_admin_user.id )
      courses = enrollments.map { |e| e.course }
    end

    courses.each { |c| c.url = "admin/course_page?method=show&course_id=#{c.id}" }
    request['courses'] = courses

    render 'course_actions'

  end # content
end
