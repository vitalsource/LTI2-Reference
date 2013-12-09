require 'rubygems'
require 'oauth'
require 'httparty'
require 'json'
  
def hash_to_query_string(hash)
  hash.keys.inject('') do |query_string, key|
    query_string << "&" unless key == hash.keys.first
    query_string << "#{URI.encode(key.to_s)}=#{CGI.escape(hash[key])}"
  end
end
  
def hash_to_authorization_header(hash)
  hash.keys.inject('') do |query_string, key|
    query_string << ", " unless key == hash.keys.first
    query_string << "#{URI.encode(key.to_s)}=\"#{CGI.escape(hash[key])}\""
  end
end

base_uri = "http://localhost:3000"
# make the consumer out of your secret and key
consumer_key = "12345"
consumer_secret = "secret"
consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
                               :site => base_uri,
                               :request_token_path => "/oauth/request_token",
                               :authorize_path => "/oauth/authorize",
                               :access_token_path => "/oauth/access_token",
                               :scheme => :header)

# make the access token from your consumer
access_token = OAuth::AccessToken.new consumer

options = {
        :scheme => 'body',
        :timestamp => Time.now.to_i.to_s,
        :nonce => (rand*10E12).to_i.to_s
}

non_oauth_params = { 'user_id' => 'jt', 'roles' => 'student'}
data = hash_to_query_string(non_oauth_params)

uri = '/tenants/3/echo'
full_uri = base_uri+uri

request = consumer.create_signed_request(:post, uri, nil, options, data)

puts ::OAuth::Signature.signature_base_string(request, options={:consumer => consumer, :uri => full_uri})   
puts "oauth_body_hash: " + Base64.encode64(Digest::SHA1.digest 'user_id=jt'.chomp).gsub(/\n/,'')

hash = {}
request.body.split(/&/).each do |param|
  key, val = param.split(/=/).map { |v| CGI.unescape(v) }
  hash[key] = val
end

headers = {}
headers['Authorization'] = 'OAuth ' + hash_to_authorization_header(hash)
headers['User-Agent'] = 'OAuth gem v0.4.6'
headers['Accept'] = '*/*'
headers['Content-Type'] = 'application/x-www-form-encoded'
headers['Content-Length'] = data.length.to_s
   

response = HTTParty.post full_uri, :body =>data,
  :headers => headers,
  :timeout => 3600

puts response.body
