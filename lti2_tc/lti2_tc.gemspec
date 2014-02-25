$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lti2_tc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lti2_tc"
  s.version     = Lti2Tc::VERSION
  s.authors     = ["John Tibbetts"]
  s.email       = ["john.tibbetts@ingramcontent.com"]
  s.homepage    = "http://vitalsource.com"
  s.summary     = "Lti2 Tool Consumer"
  s.description = "Lti2 Tool Consumer"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  s.add_dependency "mysql2"

  s.add_development_dependency "sqlite3"
end
