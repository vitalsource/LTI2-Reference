
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

params = @params.dup
params['oauth_signature_method'] = "plaintext"
request = Lti2Commons::Signer.create_signed_request @launch_url, @http_method, @consumer_key, @consumer_secret, params
puts(request.verify_signature? @consumer_secret, @nonce_cache)

