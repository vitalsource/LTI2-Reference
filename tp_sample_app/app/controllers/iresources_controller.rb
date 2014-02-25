class IresourcesController < ApplicationController
    
  def create
    pre_process_tenant
    parameters = request.parameters
    unless is_parameters_in_flash
      @iresource = Iresource.new
      @iresource.tenant_id = @tenant.id
      @iresource.result_uri = parameters['custom_result_uri']
      @iresource.userid = parameters['user_id']
      @iresource.contextid = parameters['context_id']
      @iresource.save
      save_request_parameters_to_flash
      puts "form: #{@iresource}"
    end
  end
  
  def update
    restore_request_parameters_from_flash
    lti_context = params['lti_context']
    @tenant = Tenant.find(lti_context['_tenant_id'])
    @iresource = Iresource.find(params[:id])
    begin
      @iresource.score = Float(params[:iresource][:score])
      if @iresource.score < 0.0 or @iresource.score > 1.0
        @iresource.errors[:score] << "Score must be in the range 0.0 to 1.0"
      else
        @iresource.save

        signed_request = create_signed_request \
          lti_context['custom_result_uri'],
          "put",
          @tenant.tenant_key,
          @tenant.secret,
          {}, 
          create_result_payload(@iresource.score),
          'application/vnd.ims.lis.v2.Result+json'
                       
        response = invoke_service(signed_request, Rails.application.config.wire_log, "Submit Result to ToolConsumer")
        
        redirect_to lti_context['launch_presentation_return_url']        
      end
    rescue Exception => e
      @iresource.errors[:score] << "Score must be a real number from 0.0 to 1.0"
    end
    save_request_parameters_to_flash
  end
  
  private
  
  def create_result_payload score
    JSON.dump({
      "@context" => "http://www.imsglobal.org/imspurl/lis/v2/ctx/Result",
      "@type" => "Result",
      "resultScore" => {"@type" => "decimal", "@value" => "#{score.to_s}"}
    })
  end
end