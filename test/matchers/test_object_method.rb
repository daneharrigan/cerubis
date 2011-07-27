module TestObjectMethod
  def test_object_name_has_letters
    assert_match 'object', Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$")
  end

  def test_object_name_can_begin_with_underscores
    assert_match '_object', Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$")
  end

  def test_object_name_cant_begin_with_periods
    refute_match '.object', Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$")
  end

  def test_object_name_has_underscores
    assert_match 'object_name', Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$")
  end

  def test_object_name_has_numbers
    assert_match 'object_name_19', Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$")
  end

  def test_object_with_attribute
    assert_match 'object.name', Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$")
  end

  def test_object_with_attribute_and_question_mark
    assert_match 'object.name?', Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$")
  end

  def test_chained_object_call
    assert_match 'object.foo.bar.baz', Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$")
  end

  def test_object_and_method_cant_have_spaces
    refute_match 'object .name', Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$")
  end
end
