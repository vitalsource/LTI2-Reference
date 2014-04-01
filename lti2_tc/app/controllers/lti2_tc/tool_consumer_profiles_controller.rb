require_dependency "lti2_tc/application_controller"

module Lti2Tc

  class ToolConsumerProfilesController < ApplicationController

    def index
      show
    end

    def show
      tcp_objects = Lti2Tc::ToolConsumerProfile.where(:tc_profile_guid => params[:id])
      tcp_object = tcp_objects.first
      if tcp_object.present?
        registry = Rails.application.config.tool_consumer_registry
        tcp = registry.tool_consumer_profile_wrapper
        tcp.substitute_text_in_all_nodes '{', '}', {'tc_profile_guid' => tcp_object.tc_profile_guid}
        logger.info(JSON.pretty_generate tcp.root)
        render :json => tcp.root, :content_type => "application/vnd.ims.lti.v2.toolconsumerprofile+json"
      else
        render :inline => "<h2>ToolConsumerProfile not found</h2>",  :status => 404
      end
    end

  end

end
