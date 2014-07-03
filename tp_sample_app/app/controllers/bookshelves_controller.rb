class BookshelvesController < ApplicationController
  before_filter :pre_process_tenant

  def create_echo
    output = "<h2>Bookshelf Tool</h2><br><br>"
    # already filtered
    parameters = request.request_parameters.reject { |k,v| k =~ /^oauth_/ }
    keys = parameters.keys.sort
    for key in keys
      output += "#{key}: #{parameters[key]}<br>"
    end
    render :inline => output
  end

  def create
    parameters = request.request_parameters.reject { |k,v| k =~ /^oauth_/ }
    parameters['context_label'] = parameters['custom_course_label']
    render :inline => (lti_link_to "/books", parameters)
  end
end
