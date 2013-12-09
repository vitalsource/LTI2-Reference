require 'rubygems'
require 'oauth'

  
def hash_to_querystring(hash)
  hash.keys.inject('') do |query_string, key|
    query_string << '&' unless key == hash.keys.first
    query_string << "#{URI.encode(key.to_s)}=#{URI.encode(hash[key])}"
  end
end

# make the consumer out of your secret and key
consumer_key = "12345"
consumer_secret = "secret"
consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
                               :site => "http://localhost:3000",
                               :request_token_path => "/oauth/request_token",
                               :authorize_path => "/oauth/authorize",
                               :access_token_path => "/oauth/access_token",
                               :scheme => :header)


options = {
        :scheme => 'body',
        :timestamp => '2-1',
        :nonce => '1234'
}

non_oauth_params = { 'user_id' => 'jt'}
final_data = hash_to_querystring non_oauth_params

request = consumer.create_signed_request(:post, '/tenants/3/echo', nil, options, params)

hash = {}
request.body.split(/&/).each do |param|
  key, val = param.split(/=/).map { |v| CGI.unescape(v) }
  hash[key] = val
end
      
puts hash.inspect

puts request.body
puts request.content_length
puts request.content_type
puts request.header