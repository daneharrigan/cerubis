require 'test_helper'

class Cerubis::NodeTest < MiniTest::Unit::TestCase
  def test_parse_returns_content
    html = '<h1>Header Content</h1>'
    node = Cerubis::Node.new(html, options)
    assert_equal :static, node.type
    assert_equal html, node.render
    assert_nil node.condition
  end

  def test_content_returns_unparsed_content
    template = '<h1>{{page.title}}</h1>'
    node     = Cerubis::Node.new(template, options)
    assert_equal template, node.content
  end

  def test_parse_if_block
    template = <<-STR
      {{#if true}}
        Foo Bar
      {{/if}}
    STR

    node = Cerubis::Node.new(template, options)

    assert_equal :if, node.type
    assert_equal 'Foo Bar', node.render.strip
    assert_instance_of Cerubis::Condition, node.condition
  end

  def test_adding_children
    node  = Cerubis::Node.new(blank_content, options)
    child = Cerubis::Node.new(blank_content, parent: node)

    node.children << child
    assert_includes node.children, child
  end

  def test_passing_parent_in_options_sets_it_in_node
    node  = Cerubis::Node.new(blank_content, options)
    child = Cerubis::Node.new(blank_content, parent: node)
    assert_equal node, child.parent
  end

  def test_node_context_traverses_to_parent_template
    template = Cerubis::Template.new(blank_content, foo: :bar)
    node     = Cerubis::Node.new(blank_content, parent: template)
    child    = Cerubis::Node.new(blank_content, parent: node)

    assert_equal template.context, child.context
  end

  private
    def options
      { parent: StubObject.new }
    end

    def blank_content
      ''
    end
end
