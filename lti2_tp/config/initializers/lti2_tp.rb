include Lti2Commons
include WireLogSupport

NONCE_TIME_TO_LIVE = 300  # seconds
Rails.application.config.nonce_cache = Cache.new :ttl => NONCE_TIME_TO_LIVE

if ActiveRecord::Base.connection.table_exists? 'lti2_tp_registries'
  Rails.application.config.tool_provider_registry = Lti2Tp::ToolProviderRegistry.new
end

Rails.application.config.wire_log = WireLog.new "ToolProvider", "#{Rails.root}/public/wirelog.html"
