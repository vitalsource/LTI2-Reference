#TODO This test always rollsback commit but only in TestCase env.  Something about fixtures

ENV["RAILS_ENV"] = "development"
require File.expand_path('../../../config/environment', __FILE__)

holder = ::Lti2TpContext.get_holder({})
holder['test'] = 'one'
puts holder['test']
