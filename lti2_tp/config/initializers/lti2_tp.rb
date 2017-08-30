include Lti2Commons
include WireLogSupport

NONCE_TIME_TO_LIVE = 300 # seconds
Rails.application.config.nonce_cache = Cache.new :ttl => NONCE_TIME_TO_LIVE

Rails.application.config.tool_provider_registry = Lti2Tp::ToolProviderRegistry.new
Rails.application.config.wire_log = WireLog.new "ToolProvider", File.expand_path("../tc_sample_app/public/wirelog.html")