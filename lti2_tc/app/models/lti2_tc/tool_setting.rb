module Lti2Tc
  class ToolSetting < ActiveRecord::Base
    belongs_to :scopeable, :polymorphic => true
    attr_accessible :scopeable_id, :scopeable_type, :tool_id, :name, :value

    COLLECTION_TYPES = [:Tool, :Context, :Ltilink]

    def self.collection_index(collection_type)
      COLLECTION_TYPES.find_index(collection_type.to_sym)
    end

    def self.create_uri(tool_id, scopeable_type, scopeable_id=nil)
      tool_consumer_registry = Rails.application.config.tool_consumer_registry
      result = "#{tool_consumer_registry.tc_deployment_url}/lti2_tc/tool_settings/#{tool_id}"
      if scopeable_type == 'Context'
        result << "/context/#{scopeable_id}"
      elsif scopeable_type == 'Ltilink'
        result << "/ltilink/#{scopeable_id}"
      end
      result
    end

    def self.create_reachable_uris(tool_id, scopeable_type, scopeable_id=nil)
      result = {}
      start_index = self.collection_index(scopeable_type)
      (start_index...0).each do |index|
        case index
          when 0
            result[:Tool] = self.create_uri(tool_id, 'Tool')
          when 1
            result[:Context] = self.create_uri(tool_id, 'Context', scopeable_id)
          when 2
            result[:Ltilink] = self.create_uri(tool_id, 'Ltilink', scopeable_id)
            link = Link.find(scopeable_id)
            # for next iteration
            scopeable_id = link.course.id
        end
      end
      result
    end

    def self.parse_uri(path)
      m = /^\/lti2_tc\/tool_settings\/(.*)\/context\/(.*)$/.match(path)
      if m.present?
        return ['Context', m[1], m[2].to_i]
      end
      m = /^\/lti2_tc\/tool_settings\/(.*)\/ltilink\/(.*)$/.match(path)
      if m.present?
        return ['Ltilink', m[1], m[2].to_i]
      end
      m = /^\/lti2_tc\/tool_settings\/(.*)$/.match(path)
      if m.present?
        return ['Tool', m[1], nil]
      end
      return [nil, nil, nil]
    end

    def to_uri
      ToolSetting.create_uri(self.tool_id, self.scopeable_type, self.scopeable_id)
    end
  end
end
