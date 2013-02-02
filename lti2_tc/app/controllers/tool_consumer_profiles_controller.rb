
class ToolConsumerProfilesController < ApplicationController

  def index
    show
  end
  
  def show
    tcp_objects = ToolConsumerProfile.where(:tc_profile_guid => params[:id])
    tcp_str = tcp_objects.first.tc_profile
    logger.info(tcp_str)
    tcp = JSON.load(tcp_str)
    response = render :json => tcp, :content_type => "application/vnd.ims.lti.v2.ToolConsumerProfile+json"
  end  
end