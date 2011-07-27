module TestCloseBlock
  def test_closing_block_name_only
    assert_match '{{/if}}', Cerubis::Matcher::CloseBlock
  end

  def test_closing_block_name_with_underscores
    assert_match '{{/if_block}}', Cerubis::Matcher::CloseBlock
  end

  def test_dont_match_closing_with_beginning_space
    refute_match '{{ /if_block}}', Cerubis::Matcher::CloseBlock
  end

  def test_dont_match_closing_with_ending_space
    refute_match '{{/if_block }}', Cerubis::Matcher::CloseBlock
  end

  def test_dont_match_closing_with_middle_space
    refute_match '{{/if block}}', Cerubis::Matcher::CloseBlock
  end

  def test_dont_match_closing_with_period
    refute_match '{{/if.block}}', Cerubis::Matcher::CloseBlock
  end
end
