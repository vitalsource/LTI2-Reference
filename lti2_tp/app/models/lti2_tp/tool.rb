module Lti2Tp
  class Tool < ActiveRecord::Base
    
    def get_tool_profile( tool_options=nil )
      tool_provider_registry = Rails.application.config.tool_provider_registry
      tool_profile = Lti2Commons::JsonWrapper.new( self.tool_profile_template )
      tool_profile.substitute_text_in_all_nodes( '{', '}', tool_provider_registry.registry )

      # only if tool_options, provided prune day available resource_handlers
      if tool_options
        resource_handlers = tool_profile.first_at('resource_handler')
        resource_handlers_to_delete = []
        resource_handlers.each { |resource_handler|
          resource_handler_wrapper = Lti2Commons::JsonWrapper.new( resource_handler )
          unless tool_options.include? resource_handler_wrapper.first_at('name.default_value')
            resource_handlers_to_delete << resource_handler
          end
        }
        resource_handlers_to_delete.each { |rh|
          resource_handlers.delete( rh )
        }
      end
      tool_profile.root
    end

  end
end
