require 'test_helper'
require 'nodes/test_node_defaults'

class Cerubis::TextNodeTest < MiniTest::Unit::TestCase
  include TestNodeDefaults

  def test_render_returns_content_with_variables_replaced
    skip "Variable replacement doesn't happen yet"

    node    = Cerubis::TextNode.new(content, options)
    assert_equal '<h1>Foo Title</h1>', node.render
  end

  private
    def class_name
      Cerubis::TextNode
    end
end
