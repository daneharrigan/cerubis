require 'test_helper'

class Cerubis::ConditionTest < MiniTest::Unit::TestCase
  def test_context_objects
    condition_str = '2 > 1'
    context   = Cerubis::Context.new
    condition = Cerubis::Condition.new(condition_str, :type => :if, :context => context)

    assert condition.true?
    assert_equal ['2', '>', '1'], condition.parsed_content
  end

  def test_parsed_content
    condition_str = 'item > item2'
    context   = Cerubis::Context.new(:item => 2, :item2 => 1)
    condition = Cerubis::Condition.new(condition_str, :type => :if, :context => context)

    assert condition.true?
    assert_equal 2, condition.context_objects.first
    assert_equal 1, condition.context_objects.last
  end

  def test_if_true_condition
    condition_str = 'true'
    context   = Cerubis::Context.new
    condition = Cerubis::Condition.new(condition_str, :type => :if, :context => context)

    assert condition.true?
  end

  def test_if_2_greater_than_1
    condition_str = '2 > 1'
    context   = Cerubis::Context.new
    condition = Cerubis::Condition.new(condition_str, :type => :if, :context => context)

    assert condition.true?
  end

  def test_if_object_method
    condition_str = 'item.empty?'
    item      = StubObject.new(:empty? => true)
    context   = Cerubis::Context.new(:item => item)
    condition = Cerubis::Condition.new(condition_str, :type => :if, :context => context)

    assert condition.true?
  end

  def test_if_1_greater_than_2_fails
    condition_str = '1 > 2'
    context   = Cerubis::Context.new
    condition = Cerubis::Condition.new(condition_str, :type => :if, :context => context)

    refute condition.true?
  end

  def test_in_operator_used_in_if_block
    assert_raises Cerubis::SyntaxError do
      condition_str = 'item in items'
      context   = Cerubis::Context.new
      condition = Cerubis::Condition.new(condition_str, :type => :if, :context => context)
      condition.true?
    end
  end

  def test_loop_in_block_true
    condition_str = 'item in items'
    context   = Cerubis::Context.new(:items => [1,2,3,4])
    condition = Cerubis::Condition.new(condition_str, :type => :loop, :context =>  context)
    assert condition.true?
  end

  def test_loop_in_block_false
    condition_str = 'item in items'
    context   = Cerubis::Context.new(:items => [])
    condition = Cerubis::Condition.new(condition_str, :type => :loop, :context => context)
    refute condition.true?
  end
end
