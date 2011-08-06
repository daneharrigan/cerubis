require 'test_helper'

class Cerubis::Blocks::LoopTest < MiniTest::Unit::TestCase
  def setup
    context = Cerubis::Context.new(items: [1,2,3])
    parent  = StubObject.new(context: context)
    content = <<-STR
    {{#loop item in items}}
      <p>{{ item }}</p>
    {{/loop}}
    STR

    node    = Cerubis::BlockNode.new(content, parent: parent)
    @output = node.render
    @block  = node.block
  end

  def test_block_is_instance_of_loop_block_class
    assert_instance_of Cerubis::Blocks::Loop, @block
  end

  def test_block_condition_is_true
    assert @block.true?
  end

  def test_rendered_block
    html = Capybara::Node::Simple.new(@output)
    assert html.has_selector?('p', text: '1')
    assert html.has_selector?('p', text: '2')
    assert html.has_selector?('p', text: '3')
  end
end
