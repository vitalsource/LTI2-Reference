class ToolSetting < ActiveRecord::Base
  belongs_to :scopeable, :polymorphic => true

  def self.create_uri(tool_id, scopeable_type, scopeable_id=nil)
    tool_consumer_registry = Rails.application.config.tool_consumer_registry
    result = "#{tool_consumer_registry.tc_deployment_url}/toolsettings/#{tool_id}"
    if scopeable_type == 'Context'
      result << "/context/#{scopeable_id}"
    elsif scopeable_type == 'Ltilink'
      result << "/ltilink/#{scopeable_id}"
    end
    result
  end

  def to_uri
    create_id(self.tool_id, self.scopeable_type, self.scopeable_id)
  end
end