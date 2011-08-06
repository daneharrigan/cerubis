require 'test_helper'
require 'methods/test_array_methods'
require 'methods/test_string_methods'
require 'methods/test_float_methods'
require 'methods/test_fixnum_methods'
require 'methods/test_hash_methods'

class Cerubis::MethodTest < MiniTest::Unit::TestCase
  include TestArrayMethods
  include TestStringMethods
  include TestFloatMethods
  include TestFixnumMethods
  include TestHashMethods

  def setup
    @obj = FooObj.new
  end

  def test_method_is_allowed
    assert @obj.cerubis_respond_to?(:foo)
  end

  def test_nested_method_is_allowed
    assert @obj.foo.cerubis_respond_to?(:baz)
  end

  def test_method_is_not_allowed
    refute @obj.cerubis_respond_to?(:bar)
  end

  def test_nested_method_is_not_allowed
    refute @obj.foo.cerubis_respond_to?(:cux)
  end
end

class FooObj
  include Cerubis::Method
  cerubis_method :foo

  def foo
    BazObj.new
  end

  def bar
    "Not Allowed"
  end
end

class BazObj
  include Cerubis::Method
  cerubis_method :baz

  def baz
    "Allowed"
  end

  def cux
    "Not Allowed"
  end
end
