module Lti2Tc

  class Tool < ActiveRecord::Base

    has_many :resources
    has_many :tool_settings, :as => :scopeable

    def get_tool_proxy
      (Lti2Commons::JsonWrapper.new self.tool_proxy)
    end

  end

end
