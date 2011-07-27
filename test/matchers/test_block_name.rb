module TestBlockName
  def test_block_names_have_letters
    assert_match 'if', Regexp.new(Cerubis::Matcher::BlockName)
  end

  def test_block_names_have_underscores
    assert_match 'if_block', Regexp.new(Cerubis::Matcher::BlockName)
  end

  def test_block_names_have_numbers
    assert_match 'if_block_19', Regexp.new(Cerubis::Matcher::BlockName)
  end

  def test_block_names_can_start_with_underscores
    assert_match '_if', Regexp.new(Cerubis::Matcher::BlockName)
  end

  def test_block_names_dont_have_periods
    refute_match 'if.block', Regexp.new("^#{Cerubis::Matcher::BlockName}$")
  end

  def test_block_names_dont_have_spaces
    refute_match 'if block', Regexp.new("^#{Cerubis::Matcher::BlockName}$")
  end
end
