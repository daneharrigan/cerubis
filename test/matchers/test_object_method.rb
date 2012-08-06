module TestObjectMethod
  def test_object_name_has_letters
    assert_match Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$"), 'object'
  end

  def test_object_name_can_begin_with_underscores
    assert_match Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$"), '_object'
  end

  def test_object_name_cant_begin_with_periods
    refute_match Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$"), '.object'
  end

  def test_object_name_has_underscores
    assert_match Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$"), 'object_name'
  end

  def test_object_name_has_numbers
    assert_match Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$"), 'object_name_19'
  end

  def test_object_with_attribute
    assert_match Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$"), 'object.name'
  end

  def test_object_with_attribute_and_question_mark
    assert_match Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$"), 'object.name?'
  end

  def test_chained_object_call
    assert_match Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$"), 'object.foo.bar.baz'
  end

  def test_object_and_method_cant_have_spaces
    refute_match Regexp.new("^#{Cerubis::Matcher::ObjectMethod}$"), 'object .name'
  end
end
