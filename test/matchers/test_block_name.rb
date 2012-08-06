module TestBlockName
  def test_block_names_have_letters
    assert_match Regexp.new(Cerubis::Matcher::BlockName), 'if'
  end

  def test_block_names_have_underscores
    assert_match Regexp.new(Cerubis::Matcher::BlockName), 'if_block'
  end

  def test_block_names_have_numbers
    assert_match Regexp.new(Cerubis::Matcher::BlockName), 'if_block_19'
  end

  def test_block_names_can_start_with_underscores
    assert_match Regexp.new(Cerubis::Matcher::BlockName), '_if'
  end

  def test_block_names_dont_have_periods
    refute_match Regexp.new("^#{Cerubis::Matcher::BlockName}$"), 'if.block'
  end

  def test_block_names_dont_have_spaces
    refute_match Regexp.new("^#{Cerubis::Matcher::BlockName}$"), 'if block'
  end
end
