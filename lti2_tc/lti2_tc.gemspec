$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lti2_tc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lti2_tc"
  s.version     = Lti2Tc::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Lti2Tc."
  s.description = "TODO: Description of Lti2Tc."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", '3.2.6'

  s.add_dependency "mysql2"

  s.add_development_dependency "sqlite3"
end
