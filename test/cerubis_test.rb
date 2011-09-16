require 'test_helper'

class CerubisTest < MiniTest::Unit::TestCase
  def test_render_returns_a_template
    assert_instance_of Cerubis::Template, Cerubis.render('')
  end

  def test_blocks_returns_block_collection
    assert_instance_of Hash, Cerubis.blocks
  end

  def test_helpers_returns_array
    assert_instance_of Hash, Cerubis.helpers
  end

  def test_helpers_contains_single_registered_helper
    Cerubis.register_helper :foo_helper, FooMod
    assert_equal FooMod, Cerubis.helpers[:foo_helper]
  end

  def test_helpers_contains_multiple_registered_helpers
    Cerubis.register_helper :foo_helper, :bar_helper, FooMod
    assert_equal FooMod, Cerubis.helpers[:foo_helper]
    assert_equal FooMod, Cerubis.helpers[:bar_helper]
  end

  module FooMod
    def foo_helper; end
    def bar_helper; end
  end
end
