require 'test_helper'

class Cerubis::TextNodeTest < MiniTest::Unit::TestCase
  def test_content_returns_unparsed_content
    node    = Cerubis::TextNode.new(content, options)
    assert_equal content, node.content
  end

  def test_context_traverses_to_parent
    parent = StubObject.new(context: { foo: :bar })
    node   = Cerubis::TextNode.new(content, parent: parent)
    assert_equal parent.context, node.context
  end

  def test_render_returns_content_with_variables_replaced
    skip "Variable replacement doesn't happen yet"

    node    = Cerubis::TextNode.new(content, options)
    assert_equal '<h1>Foo Title</h1>', node.render
  end

  private
    def options
      { title: 'Foo Title' }
    end

    def content
      '<h1>{{title}}</h1>'
    end
end
