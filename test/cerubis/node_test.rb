require 'test_helper'

class Cerubis::NodeTest < MiniTest::Unit::TestCase
  def test_parse_returns_content
    html = '<h1>Header Content</h1>'
    node = Cerubis::Node.new(html)
    assert_equal :static, node.type
    assert_equal html, node.render
    assert_nil node.condition
  end

  def test_content_returns_unparsed_content
    template = '<h1>{{page.title}}</h1>'
    node     = Cerubis::Node.new(template)
    assert_equal template, node.content
  end

  def test_parse_if_block
    template = <<-STR
      {{#if true}}
        Foo Bar
      {{/if}}
    STR

    node = Cerubis::Node.new(template)

    assert_equal :if, node.type
    assert_equal 'Foo Bar', node.render.strip
    assert_instance_of Cerubis::Condition, node.condition
  end

  def test_adding_children
    node  = Cerubis::Node.new
    child = Cerubis::Node.new

    node.children << child
    assert_includes node.children, child
  end

  def test_adding_children_sets_parent
    node  = Cerubis::Node.new
    child = Cerubis::Node.new

    node.children << child
    assert_equal node, child.parent
  end

  def test_render_nested_nodes
    root    = Cerubis::Node.new('Foo')
    child_1 = Cerubis::Node.new('Bar')
    child_2 = Cerubis::Node.new('Baz')
    child_3 = Cerubis::Node.new('Cux')
    child_4 = Cerubis::Node.new('Qux')

    root.children << child_1
    root.children << child_4

    child_1.children << child_2
    child_2.children << child_3

    assert_equal 'FooBarBazCuxQux', root.render
  end
end
