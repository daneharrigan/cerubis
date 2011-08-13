module TestHelper
  def test_one_helper_with_one_object
    assert_match Cerubis::Matcher::Helper, 'helper(obj)'
  end

  def test_one_helper_with_two_objects
    assert_match Cerubis::Matcher::Helper, 'helper(obj, 1)'
  end

  def test_one_helper_with_multiple_objects
    assert_match Cerubis::Matcher::Helper, 'helper(obj, 1, foo)'
  end

  def test_one_helper_with_two_objects_one_with_quotes
    assert_match Cerubis::Matcher::Helper, "helper(obj, 'foo')"
  end
end
