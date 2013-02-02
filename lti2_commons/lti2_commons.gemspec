# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "lti2_commons"
  gem.version       = "1.0"
  gem.authors       = ["John Tibbetts"]
  gem.email         = ["jtibbetts@kinexis.com"]
  gem.description   = %q{LTI common utilities}
  gem.summary       = %q{LTI common utilities}

  gem.add_dependency 'oauth', '~> 0.4.5'
  
  gem.files         = Dir['{lib/**/*,[A-Z]*}']
  
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency    'omniauth', '~> 1.0'
  gem.add_runtime_dependency    'curb'
  gem.add_runtime_dependency    'httparty'
  gem.add_runtime_dependency    'lrucache'

end
