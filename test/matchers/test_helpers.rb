module TestHelpers
  def test_helpers_with_one_object
    assert_match Cerubis::Matcher::Helpers, 'helper obj'
  end

  def test_helpers_with_one_object_and_method
    assert_match Cerubis::Matcher::Helpers, 'helper obj.method'
  end

  def test_helpers_with_two_objects
    assert_match Cerubis::Matcher::Helpers, 'helper obj, 1'
  end

  def test_helpers_with_multiple_objects
    assert_match Cerubis::Matcher::Helpers, 'helper obj, 1, foo'
  end

  def test_helpers_with_two_objects_one_with_quotes
    assert_match Cerubis::Matcher::Helpers, "helper obj, 'foo'"
  end
end
