class ToolSetting < ActiveRecord::Base
  belongs_to :scopeable, :polymorphic => true

  def to_uri
    tool_consumer_registry = Rails.application.config.tool_consumer_registry
    result = "#{tool_consumer_registry.tc_deployment_url}/toolsettings/#{tool_id}"
    if scopeable_type == 'Context'
      result << "/context/#{scopeable_id}"
    elsif scopeable_type == 'Ltilink'
      result << "/ltilink/#{scopeable_id}"
    end
    result
  end
end