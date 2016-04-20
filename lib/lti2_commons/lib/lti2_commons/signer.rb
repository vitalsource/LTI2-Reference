require 'uri'
require 'oauth'
require_relative 'oauth_request'

module Lti2Commons
  module Signer
    # Creates an OAuth signed request using the OAuth Gem - https://github.com/oauth/oauth-ruby
    #
    # @param launch_url [String]  Endpoint of service to be launched
    # @param http_method [String] Http method ('get', 'post', 'put', 'delete')
    # @param consumer_key [String] OAuth consumer key
    # @param consumer_secret [String] OAuth consumer secret
    # @param params [Hash] Non-auth parameters or oauth parameter default values
    #        oauth_timestamp => defaults to current time
    #        oauth_nonce => defaults to random number
    #        oauth_signature_method => defaults to HMAC-SHA1 (also RSA-SHA1 supported)
    # @param body [String] Body content.  Usually would include this for body-signing of non form-encoded data.
    # @param content_type [String] HTTP CONTENT-TYPE header; defaults: 'application/x-www-form-urlencoded'
    # @return [Request] Signed request
    def create_signed_request(launch_url, http_method, consumer_key, consumer_secret, params = {},
        body = nil, content_type = nil, accept = nil)
      params['oauth_consumer_key'] = consumer_key
      params['oauth_nonce'] = (rand * 10E12).to_i.to_s unless params.key? 'oauth_nonce'
      params['oauth_signature_method'] = 'HMAC-SHA1' unless params.key? 'oauth_signature_method'
      params['oauth_timestamp'] = Time.now.to_i.to_s unless params.key? 'oauth_timestamp'
      params['oauth_version'] = '1.0' unless params.key? 'oauth_version'
      params['oauth_callback'] = 'about:blank'

      content_type = 'application/x-www-form-urlencoded' unless content_type

      launch_url = URI.unescape(launch_url).downcase
      uri = URI.parse(launch_url)

      # flatten in query string arrays
      if uri.query && uri.query != ''
        CGI.parse(uri.query).each do |query_key, query_values|
          params[query_key] = query_values.first unless params[query_key]
        end
      end

      final_uri = uri
      uri = URI.parse(launch_url.split('?').first)

      unless content_type == 'application/x-www-form-urlencoded'
        params['oauth_body_hash'] = compute_oauth_body_hash body if body
      end

      request = OAuth::OAuthProxy::OAuthRequest.new(
        'method' => http_method.to_s.upcase,
        'uri' => uri,
        'parameters' => params,
        'final_uri' => final_uri
      )

      request.body = body
      request.content_type = content_type
      request.accept = accept

      request.sign!(consumer_secret: consumer_secret)

      # puts "Sender secret: #{consumer_secret}"
      request
    end

    private

    # Creates the value of an OAuth body hash
    #
    # @param launch_url [String] Content to be body signed
    # @return [String] Signature base string (useful for debugging signature problems)
    def compute_oauth_body_hash(content)
      Base64.encode64(Digest::SHA1.digest(content.chomp)).gsub(/\n/, '')
    end
  end
end
