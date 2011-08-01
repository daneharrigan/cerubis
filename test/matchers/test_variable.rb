module TestVariable
  def test_output_object
    assert_match '{{object}}', Cerubis::Matcher::Variable
  end

  def test_output_object_with_spaces
    assert_match '{{ object }}', Cerubis::Matcher::Variable
  end

  def test_output_object_attribute
    assert_match '{{object.attribute}}', Cerubis::Matcher::Variable
  end

  def test_output_object_attribute_with_spaces
    assert_match '{{ object.attribute }}', Cerubis::Matcher::Variable
  end

  def test_output_object_attribute_chain
    assert_match '{{object.attribute.attr2}}', Cerubis::Matcher::Variable
  end

  def test_output_object_attribute_chain_with_spaces
    assert_match '{{ object.attribute.attr2 }}', Cerubis::Matcher::Variable
  end
end
