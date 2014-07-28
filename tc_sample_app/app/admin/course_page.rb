ActiveAdmin.register_page 'Course Page' do

  menu :label => 'Course Page', :parent => 'LMS...'

  content :title => proc{ I18n.t('active_admin.dashboard') } do

    if params.has_key? 'lti_errormsg'
      div :style => "color: red" do
        span params['lti_errormsg']
      end
    end

    method = params['method']
    course_id = params['course_id']
    link_id = params['link_id']
    toggle = params['toggle']

    # special cases first
    if method == 'toggle'
      link = Lti2Tc::Link.find( link_id )
      toggle = params['toggle']
      if toggle
        link.is_enabled = toggle == 'true'
        link.save
      end
    elsif method == 'delete'
      begin
        link = Lti2Tc::Link.find( link_id )
        link.delete
      rescue
        # ignore
      end
    elsif method == 'newtool'
      course = Course.find( course_id )
      resource_link_label = params['resource_link_label']
      is_enabled = params['is_enabled'] == 'on'
      resource_id = params['resource_id']
      grade_item_id = params['grade_item_id'] unless params['grade_item_id'] == -1  # blank value
      resource = Resource.find( resource_id )
      custom_parameters = {}
      custom_param_string = params['custom_parameters']
      custom_param_string_array = custom_param_string.split(/\r?\n/)
      custom_param_string_array.each do |line|
        line = line.strip
        zones = line.split '='
        if zones.length == 2
          custom_parameters[zones[0]] = zones[1]
        end
      end
      new_link = Lti2Tc::Link.new
      new_link.resource_link_label = resource_link_label
      new_link.course_id = course_id
      new_link.resource_id = resource_id
      new_link.is_enabled = is_enabled
      new_link.link_parameters = JSON.dump custom_parameters
      new_link.grade_item_id = grade_item_id
      new_link.save
    end

    # show the courses
    unless method == 'link'
      course = Course.find( course_id )
      request['course'] = course
      is_non_student = current_admin_user.role != 'student'

      links = Lti2Tc::Link.where( :course_id => course.id )
      links.each { |link|
        link.is_link_visible = is_non_student || link.is_ready_for_use
        link.url = "/admin/course_page?method=link&link_id=#{link.id}"
        if link.is_enabled
          link.toggle_label = 'disable'
        else
          link.toggle_label = 'enable'
        end
        if link.grade_item_id and link.grade_item_id >= 0
          grade_item = GradeItem.find( link.grade_item_id )
          link.grade_item_label = grade_item.label
          grade_result = GradeResult.where( :link_id => link.id, :admin_user_id => current_admin_user.id ).first
          link.grade_result = grade_result.result if grade_result
        else
          link.grade_item_label = ''
        end
      }

      # prepare resource key and list
      resources = Lti2Tc::Resource.order('name').all
      resource_list = []
      resource_map = {}
      resources.each do |r|
        resource_label = "#{r.name}: #{r.description}"
        resource_list << r.id
        resource_map[r.id] = resource_label
      end
      request['resource_list'] = resource_list.sort
      request['resource_map'] = resource_map

      # prepare grade_item list
      grade_items = GradeItem.order('label').all
      grade_item_list = [-1]
      grade_item_map = {-1 => '--'}
      grade_items.each do |g|
        grade_item_label = "#{g.label}"
        grade_item_list << g.id
        grade_item_map[g.id] = grade_item_label
      end
      request['grade_item_list'] = grade_item_list
      request['grade_item_map'] = grade_item_map

      request['is_non_student'] = is_non_student
      request['links'] = links

      render 'course_page'

    else  # launch a link
      if link_id
        link = Lti2Tc::Link.find( link_id )
        render :inline => link.lti_launch(
          current_admin_user, "/admin/course_page?method=show&course_id=#{link.course.id}"
        )
      else
        raise 'Missing method parameter for course_page'
      end
    end

  end # content
end
