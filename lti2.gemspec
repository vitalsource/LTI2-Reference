$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'lti2/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'lti2'
  s.version     = Lti2::VERSION
  s.authors     = ['John Tibbetts, James Rissler']
  s.email       = ['jtibbetts@kinexis.com, james.rissler@ingramcontent.com']
  s.summary     = 'LTI2 Engine.'
  s.description = 'Lti2 Engine.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails'

  # lti2 commons
  s.add_runtime_dependency 'oauth', '~> 0.4.7'
  s.add_runtime_dependency 'httparty'
  s.add_runtime_dependency 'lrucache'
  s.add_runtime_dependency 'jsonpath'
  s.add_runtime_dependency 'uuid'
  s.add_runtime_dependency 'rb-readline'

  # automated tests
  s.add_development_dependency 'rspec-rails'

  s.add_development_dependency 'sqlite3'
end
