module Lti2Tc

  class ApplicationController < ActionController::Base

    include OAuth::OAuthProxy

    def pre_process_tenant
      Lti2Tc::Authorizer::pre_process_tenant( request )
    end

    def oauth_validation_using_secret( secret )
      Lti2Tc::Authorizer::validate( request, secret )
    end

  end

end
