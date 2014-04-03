module Lti2Commons

  require 'digest'
  require 'uuid'

  module Utils

    def is_hash_intersect( node, constraint_hash )
      # failed search if constraint_hash as invalid keys
      return nil if (constraint_hash.keys - node.keys).length > 0
      node.each_pair { |k,v|
        if constraint_hash.has_key? k
          return false unless v == constraint_hash[k]
        end
      }
      true
    end

    def hash_to_query_string( hash )
      hash.keys.inject('') do |query_string, key|
        query_string << '&' unless key == hash.keys.first
        query_string << "#{URI.encode(key.to_s)}=#{CGI.escape(hash[key])}"
      end
    end

    def substitute_template_values_from_hash( source_string, prefix, suffix, hash )
      hash.each { |k,v| source_string.sub!( prefix+k+suffix, v ) }
    end

  end

end
