require 'rubygems'
require 'oauth'

# make the consumer out of your secret and key
consumer_key = "12345"
consumer_secret = "secret"
consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
                               :site => "http://localhost:3000",
                               :request_token_path => "/oauth/request_token",
                               :authorize_path => "/oauth/authorize",
                               :access_token_path => "/oauth/access_token",
                               :scheme => :header)

# make the access token from your consumer
access_token = OAuth::AccessToken.new consumer

# make a signed request!
resp = access_token.post("/tenants/3/echo", {'user_id' => 'jt'} )
if resp.code == "302"
  cookie = resp['Set-Cookie'].split('; ')[0]
  resp = access_token.post(resp['location'], {'Cookie' => cookie})
end