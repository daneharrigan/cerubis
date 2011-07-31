require 'test_helper'

class Cerubis::Blocks::IfTest < MiniTest::Unit::TestCase
  def setup
    parent  = StubObject.new
    content = <<-STR
    {{#if true}}
      Foo Content
    {{/if}}
    STR

    node    = Cerubis::BlockNode.new(content, parent: parent)
    @output = node.render
    @block  = node.block
  end

  def test_block_is_instance_of_if_block_class
    assert_instance_of Cerubis::Blocks::If, @block
  end

  def test_block_condition_is_true
    assert @block.true?
  end


  #
  # class If
  #   attr :conditions
  #   attr :node
  #
  #   def render
  #     if conditions.true?
  #       node.render
  #     end
  #   end
  # end
  #
  #
  #
end
