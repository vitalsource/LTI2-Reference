module Lti2Commons

  module SubstitutionSupport

    # Resolver resolves values by name from a variety of object sources.
    # It's useful for variable substitution.
    #
    # The supported object sources are:
    #   Hash      ::= value by key
    #   Proc      ::= single-argument block evaluation
    #   Method    ::= single-argument method obect evaluation
    #   Resolver  ::= a nested resolver.  useful for scoping resolvers; 
    #                 i.e. a constant, global inner resolver, but a one-time outer-resolver
    #   Object    ::= value by dynamic instrospection of any object's accessor
    #
    #   See the accompanying tester for numerous examples
    #
    class Resolver

      attr_accessor :resolvers

      def initialize
        @resolver_hash = Hash.new
      end

      # Add some type of resolver object_source to the Resolver
      #
      # @param key [String] A dotted name with the leading zone indicating the object category
      # @param resolver [ObjectSource] a raw object_source for resolving
      # @returns [String] value.  If no resolution, return the incoming name
      #
      def add_resolver( key, resolver )
        unless resolver.is_a? Resolver
          key_sym = key.to_sym
        else
          # Resolvers themselves should always be generic
          key_sym = :*
        end
        unless @resolver_hash.has_key? key_sym
          @resolver_hash[key_sym] = []
        end
        @resolver_hash[key_sym] << resolver
      end

      def resolve( full_name )
        full_name ||= ''
        zones = full_name.split('.')
        return full_name if zones[0].blank?
        category = zones[0].to_sym
        name = zones[1..-1].join('.')

        # Find any hits within category
        @resolver_hash.each_pair { |k, v|
          if k == category
            result = resolve_by_category( full_name, name, v )
            return result if result
          end
        }

        # Find any hits in global category
        resolvers = @resolver_hash[:*]
        result = resolve_by_category full_name, name, resolvers if resolvers
        return result if result

        return "#{full_name}"
      end

      def to_s
        "Resolver for [#{@resolver_hash.keys}]"
      end

      private

      def resolve_by_category( full_name, name, resolvers )
        for resolver in resolvers
          if resolver.is_a? Hash
            value = resolver[name]
          elsif resolver.is_a? Proc
            value = resolver.call( name )
          elsif resolver.is_a? Method
            value = resolver.call( name )
          elsif resolver.is_a? Resolver
            value = resolver.resolve( full_name )
          elsif resolver.is_a? Object
            value = resolver.send( name )
          end
          return value if value
        end
        nil
      end

    end

  end

end
