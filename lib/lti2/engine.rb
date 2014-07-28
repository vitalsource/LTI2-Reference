module Lti2
  class Engine < ::Rails::Engine
    isolate_namespace Lti2

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
