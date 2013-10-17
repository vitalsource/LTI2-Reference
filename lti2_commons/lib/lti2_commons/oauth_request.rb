require 'oauth/request_proxy/base'

module OAuth
  module OAuthProxy
    # RequestProxy for Hashes to facilitate simpler signature creation.
    # Usage:
    #   request = OAuth::RequestProxy.proxy \
    #      "method" => "iq",
    #      "uri"    => [from, to] * "&",
    #      "parameters" => {
    #        "oauth_consumer_key"     => oauth_consumer_key,
    #        "oauth_token"            => oauth_token,
    #        "oauth_signature_method" => "HMAC-SHA1"
    #      }
    #
    #   signature = OAuth::Signature.sign \
    #     request,
    #     :consumer_secret => oauth_consumer_secret,
    #     :token_secret    => oauth_token_secret,

    class OAuthRequest < OAuth::RequestProxy::Base
      proxies Hash

      attr_accessor :body, :content_type, :accept

      def self.collect_rack_parameters(rack_request)
        parameters = HashWithIndifferentAccess.new
        parameters.merge!(rack_request.query_parameters)
        parameters.merge!(self.parse_authorization_header(rack_request.headers['HTTP_AUTHORIZATION']))
        content_type = rack_request.headers['CONTENT_TYPE']
        accept = rack_request.headers['ACCEPT']
        if content_type == "application/x-www-form-urlencoded"
          parameters.merge!(rack_request.request_parameters)
        end
        parameters
      end

      def self.create_from_rack_request(rack_request)
        parameters = self.collect_rack_parameters rack_request
        result = OAuth::OAuthProxy::OAuthRequest.new \
          "method" => rack_request.method,
          "uri" => rack_request.url,
          "parameters" => parameters
        rack_request.body.rewind
        result.body = rack_request.body.read
        rack_request.body.rewind
        result
      end

      def self.parse_authorization_header(authorization_header)
        result = {}
        if authorization_header =~ /^OAuth/
          authorization_header[6..-1].split(',').inject({}) do |h,part|
            parts = part.split('=')
            name = parts[0].strip.intern
            value = parts[1..-1].join('=').strip
            value.gsub!(/\A['"]+|['"]+\Z/, "")
            result[name] = Rack::Utils.unescape(value)
          end
        end
        result
      end

      def final_uri
        @request['final_uri']
      end

      def parameters
        @request["parameters"]
      end

      def method
        @request["method"]
      end

      def normalized_uri
        super
      rescue
        # if this is a non-standard URI, it may not parse properly
        # in that case, assume that it's already been normalized
        uri
      end

      def uri
        @request["uri"]
      end

      # Creates the value of an OAuth body hash
      #
      # @param launch_url [String] Content to be body signed
      # @return [String] Signature base string (useful for debugging signature problems)    
      def compute_oauth_body_hash content
        Base64.encode64(Digest::SHA1.digest content.chomp).gsub(/\n/,'')
      end

      # A shallow+1 copy
      def copy
        result = OAuth::OAuthProxy::OAuthRequest.new \
          "method" => self.method.dup,
          "uri" => self.uri.dup,
          "parameters" => self.parameters.dup
        result.body = self.body.dup if self.body
        result
      end

      def is_timestamp_expired?(timestampString)
        timestamp = Time.at(timestampString.to_i)
        now = Time::now
        (now - timestamp).abs > 300.seconds
      end

      # Validates and OAuth request using the OAuth Gem - https://github.com/oauth/oauth-ruby
      #
      # @return [Bool] Whether the request was valid
      def verify_signature?(secret, nonce_cache, is_handle_error_not_raise_exception=true, ignore_timestamp_and_nonce=false)
        test_request = self.copy
        test_signature = test_request.sign :consumer_secret => secret
        begin
          unless self.oauth_signature == test_signature
            # puts "Secret: #{secret}"
            puts "Verify_signature--send_signature: #{self.oauth_signature}  test_signature: #{test_signature}"
            puts "Verify signature_base_string: #{self.signature_base_string}"
            raise 'Invalid signature'
          end
          unless ignore_timestamp_and_nonce
            raise 'Timestamp expired' if is_timestamp_expired? self.oauth_timestamp
            raise 'Duplicate nonce to one already received' if nonce_cache.fetch self.oauth_nonce
          end
          nonce_cache.store self.oauth_nonce, "<who-cares>"

          # check body-signing if oaut_body_signature
          if self.body and self.parameters.has_key? 'oauth_body_hash'
            raise 'Invalid signature of message body' unless compute_oauth_body_hash(self.body) == self.parameters['oauth_body_hash']
          end
          true
        rescue Exception => e
          # Utils::log(e.message)
          if is_handle_error_not_raise_exception
            false
          else
            raise e.message
          end
        end
      end

    end
  end
end