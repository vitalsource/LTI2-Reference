class Lti2ContextHolder
  SESSION_LTI2_CONTEXT_ID = 'fabericious.tc_profile.key'
  attr_accessor :lti2_context, :content_hash

  def self.get(session)
    if session.has_key?(SESSION_LTI2_CONTEXT_ID)
      result = Lti2ContextHolder.new(SESSION_LTI2_CONTEXT_ID)
    end
    if result.blank?
      result = Lti2ContextHolder.new()
      session[SESSION_LTI2_CONTEXT_ID] = result.lti2_context.id
    end

  end

  def initialize(id=nil)
    unless id.nil?
      @lti2_context = Lti2Context.find(id)
    end
    if id.nil? || lti2_context.blank?
      @lti2_context = Lti2Context.create()
    end
    begin
      @context_hash = JSON.load(@lti2_context.content)
    rescue
      @context_hash = {}
    end
  end

  def [] name
    @context_hash[name]
  end

  def []= name, value
    @context_hash[name] = value
    @lti2_context.content = JSON.dump(@context_hash)
    @lti2_context.save
  end

end