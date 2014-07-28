require "test/unit"
require File.expand_path('../../lib/lti2_commons/substitution_support', __FILE__)

include Lti2Commons
include SubstitutionSupport


class TestObject
  attr_accessor :user_id, :name

  def initialize
    @user_id = 'jt'
    @name = "john.thomas"
    @code = @name.reverse
  end

  def to_s
    @user_id
  end
end

class TestSubstitutionSupport < Test::Unit::TestCase
  def setup
    @resolver = Resolver.new
    @resolver.add_resolver "user", {'name' => "jt", 'id' => "1234"}
    @resolver.add_resolver "user", {'name' => "jt", 'id' => "9876", 'sport' => 'judo'}
    @resolver.add_resolver "course", lambda { |x| "COURSE-#{x}"}
    @resolver.add_resolver "resource", self.method(:resource_transform_sample)
    @resolver.add_resolver "testobject", TestObject.new
    @resolver.add_resolver "testnest", {'nestlevel' => 'inner'}
    @resolver.add_resolver "*",  {'ip'=> '192.168.2.177'}
  end

  def resource_transform_sample(name)
    name.reverse
  end

  def test_add_hash
    assert_equal "jt", @resolver.resolve('user.name')
    assert_equal "judo", @resolver.resolve('user.sport')
    assert_equal "192.168.2.177", @resolver.resolve('user.ip')
    assert_equal "192.168.2.177", @resolver.resolve('foo.ip')
    assert_equal "user.notfound", @resolver.resolve('user.notfound')
  end

  def test_add_block
    assert_equal "COURSE-anything", @resolver.resolve('course.anything')
  end

  def test_internal_method
    assert_equal "fdsa", @resolver.resolve('resource.asdf')
  end

  def test_testobject
    assert_equal "john.thomas", @resolver.resolve('testobject.name')
  end

  def test_nested_resolver
    outer_resolver = Resolver.new
    outer_resolver.add_resolver "testnest", {'nestlevel' => 'outer'}
    outer_resolver.add_resolver "inner", @resolver

    assert_equal "inner", @resolver.resolve('testnest.nestlevel')
    assert_equal "outer", outer_resolver.resolve('testnest.nestlevel')
    assert_equal "jt", outer_resolver.resolve('user.name')
    assert_equal "COURSE-anything", outer_resolver.resolve('course.anything')
  end

  ARGV = ['', "--name", "test_nested_resolver"]
  # Test::Unit::AutoRunner.run(false, nil, ARGV)
end