$:.push File.expand_path( '../lib', __FILE__ )

# Maintain your gem's version:
require 'lti2_tp/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'lti2_tp'
  s.version     = Lti2Tp::VERSION
  s.authors     = ['John Tibbetts']
  s.email       = ['john.tibbetts@ingramcontent.com']
  s.homepage    = 'http://vitalsource.com'
  s.summary     = 'LTI2 Tool Provider'
  s.description = 'LTI2 Tool Provider'

  s.files = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc' ]
  s.test_files = Dir[ 'test/**/*' ]

  s.required_ruby_version = '~> 2.0.0'

  s.add_dependency 'rails'

  s.add_development_dependency 'sqlite3'
end
