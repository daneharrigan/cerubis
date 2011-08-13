module TestOpenBlock
  def test_block_name_only
    assert_match '{{#if_block}}', Cerubis::Matcher::OpenBlock
  end

  def test_match_operators_without_spaces
    assert_match '{{#if a==b}}', Cerubis::Matcher::OpenBlock
  end

  def test_match_double_equals_if_with_spaces
    assert_match '{{#if a == b}}', Cerubis::Matcher::OpenBlock
  end

  def test_match_not_equals_if
    assert_match '{{#if a !== b}}', Cerubis::Matcher::OpenBlock
  end

  def test_match_greater_than_if
    assert_match '{{#if 2 > 1}}', Cerubis::Matcher::OpenBlock
  end

  def test_match_true_if
    assert_match '{{#if true}}', Cerubis::Matcher::OpenBlock
  end

  def test_match_object_if
    assert_match '{{#if item}}', Cerubis::Matcher::OpenBlock
  end

  def test_match_object_attribute_if
    assert_match '{{#if item.method}}', Cerubis::Matcher::OpenBlock
  end

  def test_dont_match_space_after_hash
    refute_match '{{ #if item}}', Cerubis::Matcher::OpenBlock
  end

  def test_dont_match_space_before_ending_currlies
    refute_match '{{#if item }}', Cerubis::Matcher::OpenBlock
  end

  def test_dont_match_single_equals
    refute_match '{{#if item = 1}}', Cerubis::Matcher::OpenBlock
  end

  def test_dont_match_object_with_beginning_period
    refute_match '{{#if .item}}', Cerubis::Matcher::OpenBlock
  end

  def test_match_if_with_string
    assert_match "{{#if 'item' == 'item'}}", Cerubis::Matcher::OpenBlock
  end

  def test_loop_syntax
    assert_match '{{#loop child in root.children}}', Cerubis::Matcher::OpenBlock
  end
end
