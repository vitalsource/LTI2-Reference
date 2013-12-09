

class DeploymentRequestsController < ApplicationController

  def show
    render :json => Rails.application.config.tool_consumer_registry.tool_consumer_profile
  end
  
end