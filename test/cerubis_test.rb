require 'test_helper'

class CerubisTest < MiniTest::Unit::TestCase
  def test_render_returns_a_template
    assert_instance_of Cerubis::Template, Cerubis.render('')
  end

  def test_blocks_returns_block_collection
    assert_instance_of Hash, Cerubis.blocks
  end

  def test_helpers_returns_array
    assert_instance_of Array, Cerubis.helpers
  end

  def test_helpers_contains_registered_helpers
    Cerubis.register_helper FooMod
    assert_includes Cerubis.helpers,  FooMod
  end

  module FooMod
    def foo_mod; end
  end
end
