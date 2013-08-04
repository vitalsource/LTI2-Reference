
class ToolSettingsController < ApplicationController
  before_filter :oauth_validation   # look in ApplicationController
  
  def show

  end
  
  def update
    begin
      grade_result = GradeResult.find(params['id'])
      body_str = request.body.read
      json_str = CGI::unescape body_str
      result_wrapper = JsonWrapper.new(json_str)   
      score_str = result_wrapper.first_at('resultScore')['@value'] 
      grade_result.result = Float(score_str)
      grade_result.save
    rescue
      raise ActionController::RoutingError.new('Not Found')
    end
    
    render :nothing => true
  end
end