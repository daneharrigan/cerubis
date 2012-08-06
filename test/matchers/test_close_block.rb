module TestCloseBlock
  def test_closing_block_name_only
    assert_match Cerubis::Matcher::CloseBlock, '{{/if}}'
  end

  def test_closing_block_name_with_underscores
    assert_match Cerubis::Matcher::CloseBlock, '{{/if_block}}'
  end

  def test_dont_match_closing_with_beginning_space
    refute_match Cerubis::Matcher::CloseBlock, '{{ /if_block}}'
  end

  def test_dont_match_closing_with_ending_space
    refute_match Cerubis::Matcher::CloseBlock, '{{/if_block }}'
  end

  def test_dont_match_closing_with_middle_space
    refute_match Cerubis::Matcher::CloseBlock, '{{/if block}}'
  end

  def test_dont_match_closing_with_period
    refute_match Cerubis::Matcher::CloseBlock, '{{/if.block}}'
  end
end
