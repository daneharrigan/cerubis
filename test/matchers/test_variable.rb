module TestVariable
  def test_variable_object
    assert_match '{{object}}', Cerubis::Matcher::Variable
  end

  def test_variable_object_with_spaces
    assert_match '{{ object }}', Cerubis::Matcher::Variable
  end

  def test_variable_object_attribute
    assert_match '{{object.attribute}}', Cerubis::Matcher::Variable
  end

  def test_variable_object_attribute_with_spaces
    assert_match '{{ object.attribute }}', Cerubis::Matcher::Variable
  end

  def test_variable_object_attribute_chain
    assert_match '{{object.attribute.attr2}}', Cerubis::Matcher::Variable
  end

  def test_variable_object_attribute_chain_with_spaces
    assert_match '{{ object.attribute.attr2 }}', Cerubis::Matcher::Variable
  end

  def test_helper_with_object
    assert_match '{{ helper(object) }}', Cerubis::Matcher::Variable
  end

  def test_helper_with_multiple_objecst
    assert_match '{{ helper(object, 1) }}', Cerubis::Matcher::Variable
  end

  def test_helper_with_within_a_helper
    assert_match '{{ helper(helper(object)) }}', Cerubis::Matcher::Variable
  end

  def test_helper_and_object_with_within_a_helper
    skip 'regex does not support nesting helpers yet'
    assert_match '{{ helper(helper(object), 1) }}', Cerubis::Matcher::Variable
  end
end
