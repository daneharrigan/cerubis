require 'test_helper'
require 'nodes/test_node_defaults'

class Cerubis::BlockNodeTest < MiniTest::Unit::TestCase
  include TestNodeDefaults

  def test_open_and_close_block_text_removed_on_render
    content = <<-STR
    {{#if true}}
      Foo Content
    {{/if}}
    STR

    node = Cerubis::BlockNode.new(content, parent: StubObject.new)
    refute_match /\{\{/, node.render
  end

  def test_variable_replacement
    content = <<-STR
    {{#if true}}
      <h1>{{title}}</h1>
    {{/if}}
    STR

    node = Cerubis::BlockNode.new(content, options)
    html = Capybara::Node::Simple.new(node.render)

    assert html.has_selector?('h1', content: 'Foo Title')
    refute_match /\{\{/, node.render
  end

  private
    def class_name
      Cerubis::BlockNode
    end
end
