require 'test_helper'

class Cerubis::Blocks::LoopTest < MiniTest::Unit::TestCase
  def setup
    context = Cerubis::Context.new(:items => [1,2,3])
    parent  = StubObject.new(:context => context)
    content = <<-STR
    {{#loop item in items}}
      <p>{{ item }}</p>
    {{/loop}}
    STR

    node    = Cerubis::BlockNode.new(content, :parent => parent)
    @output = node.render
    @block  = node.block
  end

  def test_block_is_instance_of_loop_block_class
    assert_instance_of Cerubis::Blocks::Loop, @block
  end

  def test_block_condition_is_true
    assert @block.true?
  end
end
