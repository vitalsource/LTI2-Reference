require 'rubygems'
require 'oauth'
    
# make the consumer out of your secret and key
launch_url = "http://localhost:3000/tenants/3/echo"

consumer_key = "12345"
consumer_secret = "secret"

params = { 'user_id' => 'jt', 'roles' => 'student'}

uri = URI.parse(launch_url)
if uri.port == uri.default_port
  host = uri.host
else
  host = "#{uri.host}:#{uri.port}"
end

consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
                               :site => "#{uri.scheme}://#{host}",
                               :signature_method => 'HMAC-SHA1')

path = uri.path
path = '/' if path.empty?

if uri.query && uri.query != ''
  CGI.parse(uri.query).each do |query_key, query_values|
    unless params[query_key]
      params[query_key] = query_values.first
    end
  end
end

options = {
        :scheme => 'body',
        :timestamp => @timestamp,
        :nonce => @nonce
        }

request = consumer.create_signed_request(:post, path, nil, options, params)

puts OAuth::Signature.signature_base_string(request, { :uri        => launch_url,
                                                       :consumer   => consumer } )


