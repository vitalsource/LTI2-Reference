
include Lti2Commons
include WireLogSupport

NONCE_TIME_TO_LIVE = 300  # seconds
Rails.application.config.nonce_cache = Cache.new :ttl => NONCE_TIME_TO_LIVE

if ActiveRecord::Base.connection.table_exists? 'lti2_tc_registries'
  Rails.application.config.tool_consumer_registry = Lti2Tc::ToolConsumerRegistry.new
end

Rails.application.config.wire_log = WireLog.new "ToolConsumer", File.expand_path("./public/wirelog.html")