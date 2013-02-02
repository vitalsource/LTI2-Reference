

class ResultsController < ApplicationController
  before_filter :oauth_validation   # look in ApplicationController
  
  def show
    begin
      grade_result = GradeResult.find(params['id'])
      result_json_object = {
        '@context' => "http://www.imsglobal.org/imspurl/lis/v2/ctx/Result",
        '@type' => "Result",
        'resourceScore' => { '@type' => 'decimal', '@value' => "#{grade_result.result}" }
      }
      
      render :json => result_json_object
    rescue
      raise ActionController::RoutingError.new('Not Found')
    end
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