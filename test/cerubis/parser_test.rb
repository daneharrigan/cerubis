require 'test_helper'

class Cerubis::ParserTest < MiniTest::Unit::TestCase
  def test_parse_one_block
    content = <<-STR
      <body>
      {{#if true}}
        Foo Content
      {{/if}}
      </body>
    STR
    nodes = Cerubis::Parser.new(content).nodes
    assert_equal '<body>',      nodes[0].render.strip
    assert_equal 'Foo Content', nodes[1].render.strip
    assert_equal '</body>',     nodes[2].render.strip
  end

  def test_exception_raised_if_closing_block_is_found_without_an_opening
    assert_raises(Cerubis::SyntaxError) do
      content = '{{/if}}'
      Cerubis::Parser.new(content)
    end
  end

  def test_exception_raised_if_open_block_is_found_without_a_closing
    assert_raises(Cerubis::SyntaxError) do
      content = '{{#if true}}'
      Cerubis::Parser.new(content)
    end
  end
end
