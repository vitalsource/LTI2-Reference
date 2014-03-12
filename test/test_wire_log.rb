
require File.expand_path('../../lib/lti2_commons/wire_log', __FILE__)
require File.expand_path('../../lib/lti2_commons/mock_request', __FILE__)

wl=Lti2Commons::WireLogSupport::WireLog.new  "test", "test.txt"

wl.clear_log
wl.log "test"
wl.log "tube"

wl.log <<aa
hello,
how are you?
aa

puts "done"