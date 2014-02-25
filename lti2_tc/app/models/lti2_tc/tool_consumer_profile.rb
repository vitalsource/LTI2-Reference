module Lti2Tc
  class ToolConsumerProfile < ActiveRecord::Base
    attr_accessible :tc_profile_guid, :tc_profile
  end
end
