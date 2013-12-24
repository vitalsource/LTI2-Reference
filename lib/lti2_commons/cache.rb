
require "lrucache"

module Lti2Commons
  
  # Cache adapter.  This adapter wraps a simple LRUCache gem.
  # A more scalable and cluster-friendly cache solution such as Redis or Memcache 
  # would probably be suitable in a production environment.
  # This class is used to document the interface.  In this particular case
  # the interface exactly matches the protocol of the supplied implementation.
  # Consequently, this adapter is not really required.
  class Cache
      # create cache.
      # @params options [Hash] Should include :ttl => <expiry_time>
      def initialize(options)
        @cache = LRUCache.new options
      end
      
      def clear
        @cache.clear
      end
      
      def fetch(name)
        @cache.fetch(name)
      end
      
      def store(name, value)
        @cache.store(name, value)
      end
  end
  
end