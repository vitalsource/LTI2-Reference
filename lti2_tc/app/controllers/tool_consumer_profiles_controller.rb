
class ToolConsumerProfilesController < ApplicationController

  def index
    show
  end
  
  def show
    tcp_objects = ToolConsumerProfile.where(:tc_profile_guid => params[:id])
    tcp_object = tcp_objects.first
    registry = Rails.application.config.tool_consumer_registry
    tcp = registry.tool_consumer_profile_wrapper
    tcp.substitute_text_in_all_nodes '{', '}', {'tc_profile_guid' => tcp_object.tc_profile_guid}
    logger.info(JSON.pretty_generate tcp.root)
    response = render :json => tcp.root, :content_type => "application/vnd.ims.lti.v2.toolconsumerprofile+json"
  end  
end