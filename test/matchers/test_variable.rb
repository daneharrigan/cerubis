module TestVariable
  def test_variable_object
    assert_match Cerubis::Matcher::Variable, '{{object}}'
  end

  def test_variable_object_with_spaces
    assert_match Cerubis::Matcher::Variable, '{{ object }}'
  end

  def test_variable_object_attribute
    assert_match Cerubis::Matcher::Variable, '{{object.attribute}}'
  end

  def test_variable_object_attribute_with_spaces
    assert_match Cerubis::Matcher::Variable, '{{ object.attribute }}'
  end

  def test_variable_object_attribute_chain
    assert_match Cerubis::Matcher::Variable, '{{object.attribute.attr2}}'
  end

  def test_variable_object_attribute_chain_with_spaces
    assert_match Cerubis::Matcher::Variable, '{{ object.attribute.attr2 }}'
  end

  def test_variable_helper_with_object
    assert_match Cerubis::Matcher::Variable, '{{ helper object }}'
  end

  def test_variable_helper_with_multiple_objecst
    assert_match Cerubis::Matcher::Variable, '{{ helper object, 1 }}'
  end

  def test_variable_helper_with_string
    assert_match Cerubis::Matcher::Variable, "{{ foo_helper 'foo title', obj }}"
  end
end
