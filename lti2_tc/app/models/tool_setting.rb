class ToolSetting < ActiveRecord::Base
  belongs_to :scopeable, :polymorphic => true

  def self.create_uri(tool_id, scopeable_type, scopeable_id=nil)
    tool_consumer_registry = Rails.application.config.tool_consumer_registry
    result = "#{tool_consumer_registry.tc_deployment_url}/tool_settings/#{tool_id}"
    if scopeable_type == 'Context'
      result << "/context/#{scopeable_id}"
    elsif scopeable_type == 'Ltilink'
      result << "/ltilink/#{scopeable_id}"
    end
    result
  end

  def self.parse_uri(path)
    m = /^\/tool_settings\/(.*)\/context\/(.*)$/.match(path)
    if m.present?
      return ['Context', m[1], m[2].to_i]
    end
    m = /^\/tool_settings\/(.*)\/ltilink\/(.*)$/.match(path)
    if m.present?
      return ['Ltilink', m[1], m[2].to_i]
    end
    m = /^\/tool_settings\/(.*)$/.match(path)
    if m.present?
      return ['Tool', m[1], nil]
    end
      return [nil, nil, nil]
  end

  def to_uri
    ToolSetting.create_uri(self.tool_id, self.scopeable_type, self.scopeable_id)
  end
end