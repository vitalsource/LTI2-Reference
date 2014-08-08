
require "test/unit"
require File.expand_path('../../lib/lti2_commons/message_support', __FILE__)
require File.expand_path('../../lib/lti2_commons/cache', __FILE__)
require File.expand_path('../../lib/lti2_commons/utils', __FILE__)
require File.expand_path('../../lib/lti2_commons/signer', __FILE__)
require File.expand_path('../../lib/lti2_commons/oauth_request', __FILE__)

require 'rack'
require 'oauth'

include Lti2Commons
include Signer
include Utils
include MessageSupport
include OAuth::RequestProxy

class TestOAuthRequest < Test::Unit::TestCase
  def setup
    @launch_url = 'http://localhost:3000/tenants/3'
    # @launch_url = 'http://vst-bc.com/tenants/3/books'
    @http_method = 'post'
    @consumer_key = '12345'
    @consumer_secret = 'secret'
    @params = {'oauth_consumer_key'=>'12345', 'oauth_signature_method'=> "HMAC-SHA1", 'user_id'=>'jt'}
    @oauth_request = OAuth::OAuthProxy::OAuthRequest.new \
      "method" => @http_method,
      "uri" => @launch_url, 
      "parameters" => @params
    @nonce_cache = Lti2Commons::Cache.new :ttl => 300
  end

  def create_stale_request(minutes_stale)
    now = Time::now
    stale_time = now + (minutes_stale*60.0)
    # puts "Now: #{now}  Stale_time: #{stale_time}]"
    params = @params.dup
    params['oauth_timestamp'] = stale_time.to_i
    request = Lti2Commons::Signer.create_signed_request @launch_url, @http_method, @consumer_key, @consumer_secret, params
    # dump_oauth_parameters request, "stale create"
    request
  end
    
  def dump_oauth_parameters(request, label=nil)
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    if label
      puts "*** #{label}"
    end
    puts "non_oauth_parameters: #{request.non_oauth_parameters.inspect}"
    puts "oauth_header: #{request.oauth_header}"
    puts "oauth_parameters: #{request.oauth_parameters.inspect}"
    puts "signature_base_string: #{request.signature_base_string}"
    puts "signed? #{request.signed?}"
    puts "signed_uri: #{request.signed_uri}"
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
  end
  
  def test_oauth_request
    request = Signer.create_signed_request @launch_url, @http_method, @consumer_key, @consumer_secret, @params
    dump_oauth_parameters(request, 'postsigning')
  end  
  
  def test_valid_request
    request = Signer.create_signed_request @launch_url, @http_method, @consumer_key, @consumer_secret, @params
    assert_not_nil request
    assert_equal true, request.verify_signature?(@consumer_secret, @nonce_cache)
  end
  
  def test_create_signed_request_simple_post
    request = Lti2Commons::Signer.create_signed_request @launch_url, @http_method, @consumer_key, @consumer_secret, @params
    assert_not_nil request
    signature_base_string = request.signature_base_string
    assert_equal "POST&http%3A%2F%2Flocalhost%3A3000%2Ftenants%2F3&basiclti_submit%3DPress%2520t", signature_base_string[0..77]
  end

  def test_create_signed_request_get
    request = Lti2Commons::Signer.create_signed_request @launch_url, 'get', @consumer_key, @consumer_secret, @params
    assert_not_nil request
    signature_base_string = request.signature_base_string
    assert_equal "GET&http%3A%2F%2Flocalhost%3A3000%2Ftenants%2F3&basiclti_submit%3DPress%2520t", signature_base_string[0..76]
  end

  def test_create_signed_request_put
    request = Lti2Commons::Signer.create_signed_request @launch_url, 'put', @consumer_key, @consumer_secret, @params
    assert_not_nil request
    signature_base_string = request.signature_base_string
    assert_equal "PUT&http%3A%2F%2Flocalhost%3A3000%2Ftenants%2F3&basiclti_submit%3DPress%2520t", signature_base_string[0..76]
  end

  def test_lti_message_body_from_signed_request
    request = Signer.create_signed_request @launch_url, 'put', @consumer_key, @consumer_secret, @params
    assert_not_nil request
    assert_not_nil MessageSupport.create_lti_message_body_from_signed_request request
    puts MessageSupport.create_lti_message_body_from_signed_request request
  end

  def test_lti_message_body
    assert_not_nil MessageSupport.create_lti_message_body @launch_url, @params
    puts MessageSupport.create_lti_message_body @launch_url, @params
  end
  
  def test_break_signature
    request = Lti2Commons::Signer.create_signed_request @launch_url, @http_method, @consumer_key, @consumer_secret, @params
    request.parameters['oauth_signature'] = "asdf"
    assert_equal false, (request.verify_signature? @consumer_secret, @nonce_cache)
  end
  
  def test_exception_on_signature_error
    request = Lti2Commons::Signer.create_signed_request @launch_url, @http_method, @consumer_key, @consumer_secret, @params
    request.parameters['oauth_signature'] = "asdf"
    begin
      request.verify_signature? @consumer_secret, @nonce_cache, false 
      fail "Exception expected here" 
    rescue
      # expected
    end
  end
  
  def test_timeout_within_margin
    request = create_stale_request 2
    assert_equal true, (request.verify_signature? @consumer_secret, @nonce_cache)   
    request = create_stale_request(-2)
    assert_equal true, (request.verify_signature? @consumer_secret, @nonce_cache)    
  end
  
  def test_timeout_error
    request = create_stale_request 10
    assert_equal false, (request.verify_signature? @consumer_secret, @nonce_cache)   
    request = create_stale_request(-10)
    assert_equal false, (request.verify_signature? @consumer_secret, @nonce_cache)   
  end
  
  def test_duplicate_nonce
    params = @params.dup
    params['oauth_nonce'] = "1234"
    request = Lti2Commons::Signer.create_signed_request @launch_url, @http_method, @consumer_key, @consumer_secret, params
    assert_equal true, (request.verify_signature? @consumer_secret, @nonce_cache)  
    request = Lti2Commons::Signer.create_signed_request @launch_url, @http_method, @consumer_key, @consumer_secret, params
    assert_equal false, (request.verify_signature? @consumer_secret, @nonce_cache)  
  end
  
  ARGV = ['', "--name", "test_duplicate_nonce"]
  Test::Unit::AutoRunner.run(false, nil, ARGV)
end
