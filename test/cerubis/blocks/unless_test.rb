require 'test_helper'

class Cerubis::Blocks::UnlessTest < MiniTest::Unit::TestCase
  def setup
		context = Cerubis::Context.new
    parent  = StubObject.new(:context => context)
    content = <<-STR
    {{#unless false}}
      Foo Content
    {{/unless}}
    STR

    node    = Cerubis::BlockNode.new(content, :parent => parent)
    @output = node.render
    @block  = node.block
  end

  def test_block_is_instance_of_unless_block_class
    assert_instance_of Cerubis::Blocks::Unless, @block
  end

  def test_block_condition_is_true
    assert @block.true?
  end
end
