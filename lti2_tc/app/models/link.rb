include Lti2Commons
include MessageSupport
include Signer

class Link < ActiveRecord::Base
  belongs_to :course
  belongs_to :resource
  has_many :tool_settings, :as => :scopeable

  attr_accessible :enrollment_id, :resource_link_label, :tool_id, :link_parameters, :grade_item_id
  
  def is_ready_for_use
    self.is_enabled and self.resource.tool.is_enabled
  end

  def lti_launch user, return_url
    tool_proxy = self.resource.tool.get_tool_proxy

    tool = self.resource.tool
    tool_name = tool_proxy.first_at('tool_profile.product_instance.product_info.product_name.default_value')
    raise "Tool #{tool_name} is currently disabled" unless tool.is_enabled
    
    base_url = tool_proxy.select('tool_profile.base_url_choice', 
            "selector.applies_to", "MessageHandler", 'default_base_url')
    resource_type = self.resource.resource_type
    resource_handler_node = tool_proxy.search("tool_profile.resource_handler", {'resource_type' => resource_type}, "@")
    resource_handler = JsonWrapper.new resource_handler_node
    message = resource_handler.search("@..message", {'message_type' => 'basic-lti-launch-request'}, '@')
    path = message['path']
    tp_parameters = message['parameter']
    service_endpoint = base_url + path
    
    enrollment = Enrollment.where(:admin_user_id => user.id, :course_id => self.course.id).first
    if enrollment
      role = enrollment.role
    else
      role = user.role
    end

    tool_consumer_registry = Rails.application.config.tool_consumer_registry    
    parameters = {
      'lti_version' => tool_proxy.first_at('lti_version'),
      'lti_message_type' => 'basic-lti-launch-request',
      'resource_link_id' => self.id.to_s,
      'user_id' => user.id.to_s,
      'roles' => role,
      'launch_presentation_return_url' => "#{tool_consumer_registry.tc_deployment_url}#{return_url}",
      'launch_presentation_document_target' => 'window',
      
      # optional
      'context_id' => self.course.id.to_s,
    }
    
    # add parameters from ToolProxy
    for parameter in tp_parameters
      name = parameter['name']
      if parameter.has_key? 'fixed'
        value = parameter['fixed']
      elsif parameter.has_key? 'variable'
        value = parameter['variable']
      else
        value = "[link-to-resolve]"
      end
      parameters[name] = value
    end
    
    # add parameters from Link
    link_parameter_json = self.link_parameters
    if link_parameter_json
      link_parameters = JSON.parse link_parameter_json
      parameters.merge! link_parameters
    end

    # add parameters from Settings levels
    settings = ToolSetting.where(:tool_id => tool.id, :scopeable_type => 'Tool')
    settings.each {|setting| parameters[setting.name] = setting.value}

    settings = ToolSetting.where(:tool_id => tool.id, :scopeable_id => self.course.id, :scopeable_type => 'Context')
    settings.each {|setting| parameters[setting.name] = setting.value}

    settings = ToolSetting.where(:tool_id => tool.id, :scopeable_id => self.id, :scopeable_type => 'Ltilink')
    settings.each {|setting| parameters[setting.name] = setting.value}
    
    # auto-create result (if required) and add to reference to parameters
    capabilities = resource_handler.first_at('message[0].enabled_capability')
    if capabilities and capabilities.include? "Result.autocreate"
      if self.grade_item_id
        grade_result = GradeResult.where(:link_id => self.id, :admin_user_id => user.id).first
        # TEST ONLY
        # grade_result.delete if grade_result
        # grade_result = nil
        #
        
        unless grade_result
          grade_result = GradeResult.new
          grade_result.link_id = self.id
          grade_result.admin_user_id = user.id
          grade_result.save
        else
          # note that a nil grade_result still let's us through
          unless grade_result.result.nil?
            raise "Grade result associated with this tool launch has already been filled in"
          end
        end
      end
    end
    
    # perform variable substitution on all parameters
    resolver = Lti2Commons::SubstitutionSupport::Resolver.new
    resolver.add_resolver("User", user.method(:user_resolver))
    resolver.add_resolver("Person", user.method(:person_resolver))
    course = Course.find(parameters['context_id'])
    resolver.add_resolver("CourseOffering", course.method(:course_resolver))
    resolver.add_resolver("Result", grade_result.method(:grade_result_resolver)) if grade_result

    # Settings resolvers
    resolver.add_resolver("ToolProxy", self.method(:tool_proxy_resolver))
    resolver.add_resolver("ToolProxyBinding", self.method(:tool_proxy_binding_resolver))
    resolver.add_resolver("LtiLink", self.method(:lti_link_resolver))

    # and resolve and normalize
    final_parameters = {}
    parameters.each { |k,v|
      resolved_value = resolver.resolve(v)
      if known_lti2_parameters.include? k or deprecated_lti_parameters.include? k
        final_parameters[k] = v
      else 
        name = 'custom_' + k
        lti1_name = slugify(name)
        unless name == lti1_name
          final_parameters[lti1_name] = resolved_value
        end
        final_parameters[name] = resolved_value
      end
        
    }
    
    key = self.resource.tool.key
    secret = self.resource.tool.secret
    
    signed_request = Signer::create_signed_request service_endpoint, 'post', key, secret, final_parameters
    puts "TC Signed Request: #{signed_request.signature_base_string}"
    puts "before"
    puts Rails.application.config.wire_log.inspect
    puts "after"
    body = MessageSupport::create_lti_message_body(service_endpoint, final_parameters, Rails.application.config.wire_log, "Lti Launch")
    puts body
    body
  end

  def tool_proxy_resolver(fieldname)
    if fieldname == 'custom.uri'
      tool_guid = self.resource.tool.key
      ToolSetting.create_uri(tool_guid, 'Tool')
    end
  end

  def tool_proxy_binding_resolver(fieldname)
    if fieldname == 'custom.uri'
      tool_guid = self.resource.tool.key
      ToolSetting.create_uri(tool_guid, 'Context', self.course_id)
    end
  end

  def lti_link_resolver(fieldname)
    if fieldname == 'custom.uri'
      tool_guid = self.resource.tool.key
      ToolSetting.create_uri(tool_guid, 'Ltilink', self.id)
    end
  end

  private
  
  def deprecated_lti_parameters
    ["context_title", "context_label", "resource_link_title", "resource_link_description",
      "lis_person_name_given", "lis_person_name_family", "lis_person_name_full", "lis_person_contact_email_primary",
      "user_image", "lis_person_sourcedid", "lis_course_offering_sourcedid", "lis_course_section_sourcedid",
      "tool_consumer_instance_name", "tool_consumer_instance_description", "tool_consumer_instance_url", "tool_consumer_instance_contact_email"]
  end
  
  def known_lti2_parameters
    ["lti_message_type", "lti_version", "user_id", "roles", "resource_link_id",
      "context_id", "context_type", 
      "launch_presentation_locale", "launch_presentation_document_target", "launch_presentation_css_url", 
      "launch_presentation_width", "launch_presentation_height", "launch_presentation_return_url",
      "reg_key", "reg_password", "tc_profile_url"]
  end
  
  def slugify name
    result = ""
    name.each_char { |c|
      result << (c =~ /\w/ ? c.downcase : '_')
    }
    result
  end

end