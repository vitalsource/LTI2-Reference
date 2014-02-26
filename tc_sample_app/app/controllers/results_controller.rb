

class ResultsController < ApplicationController
  def pre_process
    Lti2Tc::Authorizer::pre_process_tenant(request)
  end

  def show
    pre_process
    begin
      grade_result = GradeResult.find(params['id'])
      result_json_object = {
        '@context' => "http://purl.imsglobal.org/ctx/lti/v2/Result",
        '@type' => "Result",
        'resourceScore' => { '@type' => 'decimal', '@value' => "#{grade_result.result}" }
      }
      
      render :json => result_json_object
    rescue
      raise ActionController::RoutingError.new('Not Found')
    end
  end
  
  def update
    pre_process
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