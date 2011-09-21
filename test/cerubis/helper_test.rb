require 'test_helper'

class Cerubis::HelperTest < MiniTest::Unit::TestCase
  def test_helper_can_access_context
    context = Cerubis::Context.new(:bar => 'bar str')
    helper  = Cerubis::Helper.new(context)
    helper.extend FooHelper

    assert_equal 'bar str', helper.foo_helper('bar')
  end

  module FooHelper
    def foo_helper(obj)
      "#{context[obj.to_sym]}"
    end
  end
end
