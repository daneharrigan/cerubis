require 'test_helper'

class Cerubis::ConditionTest < MiniTest::Unit::TestCase
  def test_if_true_condition
    condition_str = 'true'
    context   = Cerubis::Context.new
    condition = Cerubis::Condition.new(condition_str, type: :if, context: context)

    assert condition.true?
  end

  def test_if_2_greater_than_1
    condition_str = '2 > 1'
    context   = Cerubis::Context.new
    condition = Cerubis::Condition.new(condition_str, type: :if, context: context)

    assert condition.true?
  end

  def test_if_object_method
    condition_str = 'item.empty?'
    item      = StubObject.new(:empty? => true)
    context   = Cerubis::Context.new(item: item)
    condition = Cerubis::Condition.new(condition_str, type: :if, context: context)

    assert condition.true?
  end

  def test_if_1_greater_than_2_fails
    condition_str = '1 > 2'
    context   = Cerubis::Context.new
    condition = Cerubis::Condition.new(condition_str, type: :if, context: context)

    refute condition.true?
  end
end
