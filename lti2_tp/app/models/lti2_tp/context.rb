module Lti2Tp

  class Context < ActiveRecord::Base

    SESSION_LTI2_CONTEXT_ID = 'lti2_tc_profile.key'

    class Holder

      attr_accessor :lti2_context

      def initialize( id=nil )
        unless id.nil?
          @lti2_context = Lti2Tp::Context.find( id )
        end
        if id.nil? || @lti2_context.blank?
          @lti2_context = Lti2Tp::Context.create()
        end
        begin
          @context_hash = JSON.load( @lti2_context.content )
        rescue
          @context_hash = nil
        end
        @context_hash ||= {}
        self
      end

      def [] name
        @context_hash[name]
      end

      def []= name, value
        @context_hash[name] = value
        @lti2_context.content = JSON.dump( @context_hash )
        @lti2_context.save
      end

      def clear name
        @context_hash.delete( name )
        @lti2_context.content = JSON.dump( @context_hash )
        @lti2_context.save
      end

    end

    def self.get_holder( session )
      # lazy create for holder
      if session.has_key?( SESSION_LTI2_CONTEXT_ID )
        result = Lti2Tp::Context::Holder.new( session[SESSION_LTI2_CONTEXT_ID] )
      end
      if result.blank?
        result = Lti2Tp::Context::Holder.new()
      end
      # reassert in class new run in same browser session
      session[SESSION_LTI2_CONTEXT_ID] = result.lti2_context.id
      result
    end

  end

end
