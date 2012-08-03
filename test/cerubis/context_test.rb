require 'test_helper'

class Cerubis::ContextTest < MiniTest::Unit::TestCase
  def test_context_returns_true
    context = Cerubis::Context.new
    assert_equal true, context.get('true')
  end

  def test_context_returns_false
    context = Cerubis::Context.new
    assert_equal false, context.get('false')
  end

  def test_context_returns_integer
    context = Cerubis::Context.new
    assert_equal 1, context.get('1')
  end

  def test_context_returns_float
    context = Cerubis::Context.new
    assert_equal 1.5, context.get('1.5')
  end

  def test_context_returns_item_from_context
    context = Cerubis::Context.new(:item => :foo)
    assert_equal :foo, context.get('item')
  end

  def test_context_returns_string_without_single_quotes
    context = Cerubis::Context.new
    assert_equal 'foo', context.get("'foo'")
  end
end
