require 'test_helper'

class CerubisTest < MiniTest::Unit::TestCase
  def test_render_returns_a_template
    assert_instance_of Cerubis::Template, Cerubis.render('')
  end
end
