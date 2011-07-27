module TestOperators
  def test_double_equals
    assert_includes Cerubis::Matcher::Operators, :==
  end

  def test_triple_equals
    assert_includes Cerubis::Matcher::Operators, :===
  end

  def test_not_equals
    assert_includes Cerubis::Matcher::Operators, :'!='
  end

  def test_not_double_equals
    assert_includes Cerubis::Matcher::Operators, :'!=='
  end

  def test_less_than
    assert_includes Cerubis::Matcher::Operators, :<
  end

  def test_greater_than
    assert_includes Cerubis::Matcher::Operators, :<
  end

  def test_less_than_equal_to
    assert_includes Cerubis::Matcher::Operators, :<=
  end

  def test_greater_than_equal_to
    assert_includes Cerubis::Matcher::Operators, :>=
  end
end
