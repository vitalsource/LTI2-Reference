require_dependency 'lti2_tc/application_controller'

module Lti2Tc

  class DeploymentRequestsController < ApplicationController

    def show
      render :json => Rails.application.config.tool_consumer_registry.tool_consumer_profile
    end

  end

end
