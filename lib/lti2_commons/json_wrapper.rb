
require 'rubygems'
require 'json'
require 'jsonpath'

module Lti2Commons
  class JsonWrapper
    attr_accessor :root
    
    def initialize(json_str_or_obj)
      @root = JsonPath.new('$').on(json_str_or_obj).first
    end

    def at(path)
      JsonPath.new(path).on(@root)
    end
    
    # Deep copy through reserialization.  Only use to preserve immutability of source.
    #
    # @return [JsonObject] A full new version of self
    def deep_copy
      JsonWrapper.new(@root.to_json)
    end
    
    def each_leaf &block
      JsonPath.new("$..*").on(@root).each { |node|
        if node.is_a? String 
          yield node
        end
      }
    end

    def first_at(path)
      at(path).first
    end
    
    # Does this node, possibly repeating, match all elements of the constraint_hash
    #
    # @params candidate [Hash/Array] node or Array of nodes to match
    # @params constraint_hash [Hash] Hash of value to match
    # @return [TreeNode] Either self or immediate child that matches constraint_hash
    def get_matching_node candidate, constraint_hash
      if candidate.is_a? Hash
        return candidate if is_hash_intersect(candidate, constraint_hash)
      elsif candidate.is_a? Array
        for child in candidate
          # are there extraneous keys in constraint_hash
          return child if is_hash_intersect(child, constraint_hash)
        end
      end
      nil    
    end
    
    # Convenience method to find a particular node with matching attributes to constraint_hash
    # and then return specific element of that node.
    # e.g., search for 'path' within the 'resource_handler' with constraint_hash attributes.
    #
    # @params path [JsonPath] path to parent of candidate array of nodes
    # @params constraint_hash [Hash] Hash of values which must match target
    # @params return_path [JsonPath] Path of element within matching target
    # @return [Object] result_path within matching node or nil
    def search(path, constraint_hash, return_path)
      candidate = JsonPath.new(path).on(@root)
      candidate = get_matching_node candidate.first, constraint_hash
      return nil unless candidate
      JsonPath.new(return_path).on(candidate).first
    end
    
    # Convenience method to find a particular node with matching attributes to constraint_hash
    # and then return specific element of that node.
    # e.g., search for 'path' within the 'resource_handler' with constraint_hash attributes.
    #
    # @params path [JsonPath] path to parent of candidate array of nodes
    # @params constraint_hash [Hash] Hash of values which must match target
    # @params return_path [JsonPath] Path of element within matching target
    # @return [Object] result_path within matching node or nil
    def select(path, selector, value, return_path)
      candidates = JsonPath.new(path).on(@root)
      for candidate in candidates
        selector_node = JsonPath.new(selector).on(candidate.first)
        if selector_node.include? value
          break
        end
      end
      if candidate
        JsonPath.new(return_path).on(candidate.first).first
      else
        nil
      end
    end
    
    def substitute_text_in_all_nodes(token_prefix, token_suffix, hash)
      self.each_leaf { |v|
        substitute_template_values_from_hash v, token_prefix, token_suffix, hash }
    end
    
    def to_pretty_json
      JSON.pretty_generate root
    end
    
    private
    
    def is_hash_intersect target_hash, constraint_hash
      # failed search if constraint_hash as invalid keys
      return nil if (constraint_hash.keys - target_hash.keys).length > 0
      target_hash.each_pair {|k,v|
        if constraint_hash.has_key? k 
          return false unless v == constraint_hash[k]
        end
      }
      true
    end
    
    def substitute_template_values_from_hash(source_string, prefix, suffix, hash)
      hash.each { |k,v| 
        source_string.sub!(prefix+k+suffix, v) }
    end

  end

end