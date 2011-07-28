require 'test_helper'

class Cerubis::ConditionTest < MiniTest::Unit::TestCase
  def test_if_true_condition
    condition_str = 'true'
    condition = Cerubis::Condition.new(condition_str, type: :if)

    assert condition.true?
    refute condition.repeat?
  end

  def test_if_2_greater_than_1
    condition_str = '2 > 1'
    condition = Cerubis::Condition.new(condition_str, type: :if)

    assert condition.true?
    refute condition.repeat?
  end
end
