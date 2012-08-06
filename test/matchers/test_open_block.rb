module TestOpenBlock
  def test_block_name_only
    assert_match Cerubis::Matcher::OpenBlock, '{{#if_block}}'
  end

  def test_match_operators_without_spaces
    assert_match Cerubis::Matcher::OpenBlock, '{{#if a==b}}'
  end

  def test_match_double_equals_if_with_spaces
    assert_match Cerubis::Matcher::OpenBlock, '{{#if a == b}}'
  end

  def test_match_not_equals_if
    assert_match Cerubis::Matcher::OpenBlock, '{{#if a !== b}}'
  end

  def test_match_greater_than_if
    assert_match Cerubis::Matcher::OpenBlock, '{{#if 2 > 1}}'
  end

  def test_match_true_if
    assert_match Cerubis::Matcher::OpenBlock, '{{#if true}}'
  end

  def test_match_object_if
    assert_match Cerubis::Matcher::OpenBlock, '{{#if item}}'
  end

  def test_match_object_attribute_if
    assert_match Cerubis::Matcher::OpenBlock, '{{#if item.method}}'
  end

  def test_dont_match_space_after_hash
    refute_match Cerubis::Matcher::OpenBlock, '{{ #if item}}'
  end

  def test_dont_match_space_before_ending_currlies
    refute_match Cerubis::Matcher::OpenBlock, '{{#if item }}'
  end

  def test_dont_match_single_equals
    refute_match Cerubis::Matcher::OpenBlock, '{{#if item = 1}}'
  end

  def test_dont_match_object_with_beginning_period
    refute_match Cerubis::Matcher::OpenBlock, '{{#if .item}}'
  end

  def test_match_if_with_string
    assert_match Cerubis::Matcher::OpenBlock, "{{#if 'item' == 'item'}}"
  end

  def test_loop_syntax
    assert_match Cerubis::Matcher::OpenBlock, '{{#loop child in root.children}}'
  end
end
