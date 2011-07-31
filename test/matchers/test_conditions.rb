module TestConditions
  def test_true
    assert_match Cerubis::Matcher::Conditions, 'true'
  end

  def test_2_greater_than_1_with_spaces
    assert_match Cerubis::Matcher::Conditions, '2 > 1'
  end

  def test_2_greater_than_1_without_spaces
    assert_match Cerubis::Matcher::Conditions, '2>1'
  end

  def test_object_attribute
    assert_match Cerubis::Matcher::Conditions, 'item.attribute'
  end

  def test_object_attribute_question_mark
    assert_match Cerubis::Matcher::Conditions, 'item.attribute?'
  end
end
