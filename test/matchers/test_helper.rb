module TestHelper
  def test_helper_with_one_object
    assert_match Cerubis::Matcher::Helper, 'helper(obj)'
  end

  def test_helper_with_one_object_and_method
    assert_match Cerubis::Matcher::Helper, 'helper(obj.method)'
  end

  def test_helper_with_two_objects
    assert_match Cerubis::Matcher::Helper, 'helper(obj, 1)'
  end

  def test_helper_with_multiple_objects
    assert_match Cerubis::Matcher::Helper, 'helper(obj, 1, foo)'
  end

  def test_helper_with_two_objects_one_with_quotes
    assert_match Cerubis::Matcher::Helper, "helper(obj, 'foo')"
  end

  def test_helper_with_nested_helper
    assert_match Cerubis::Matcher::Helper, 'helper(helper(obj))'
  end

  def test_helper_with_object_and_nested_helper
    assert_match Cerubis::Matcher::Helper, 'helper(obj, helper(obj))'
  end

  def test_helper_with_string_and_nested_helper
    assert_match Cerubis::Matcher::Helper, "helper('foo', helper(obj))"
  end

  def test_helper_with_two_nested_helpers
    assert_match Cerubis::Matcher::Helper, "helper(helper(obj), helper(obj))"
  end
end
