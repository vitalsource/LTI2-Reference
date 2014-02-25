class GradeResult < ActiveRecord::Base
  belongs_to :course
  belongs_to :admin_user
  
  attr_accessible :id, :link_id, :admin_user_id
  
  def grade_result_resolver(fieldname)
    case fieldname
    when "sourcedGUID"
      self.id.to_s
    when "sourcedId"
      self.id.to_s
    when "uri"
      tool_consumer_registry = Rails.application.config.tool_consumer_registry
      base_url = tool_consumer_registry.tc_deployment_url
      "#{base_url}/results/#{self.id}"
    end
  end
  
end