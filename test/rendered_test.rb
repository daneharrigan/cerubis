require 'test_helper'

class RenderedTest < MiniTest::Unit::TestCase
  def test_parse_single_block
    template = Cerubis.render(content)
    html = Capybara::Node::Simple.new(template.to_html)

    assert html.has_selector?('body > section', text: 'Foo Content')
  end

  def test_parse_nested_blocks
    template = Cerubis.render(nested_content)
    html = Capybara::Node::Simple.new(template.to_html)

    assert html.has_selector?('body > header > h1', text: 'Header Content')
    assert html.has_selector?('body > header > section > p', text: 'Paragraph Content')

    refute html.has_selector?('body > header > #hidden', text: 'Hidden Content')
    refute_match /\{\{/, template.to_html
  end

  def test_parse_unless_block
    template = Cerubis.render(hidden_content)
    html = Capybara::Node::Simple.new(template.to_html)

    refute html.has_selector?('body > #hidden', text: 'Hidden Content')
    refute_match /\{\{/, template.to_html
  end

  def test_parse_loop_block
    template = Cerubis.render(loop_content, collection: [1,2,3])
    html = Capybara::Node::Simple.new(template.to_html)

    assert html.has_selector?('body > p', text: 'Loop Content', count: 3)
    refute_match /\{\{/, template.to_html
  end

  private
    def content
      <<-STR
        <body>
        {{#if true}}
          <section>Foo Content</section>
        {{/if}}
        </body>
      STR
    end

    def nested_content
      <<-STR
        <body>
          <header>
          {{#if true}}
            <h1>Header Content</h1>
            {{#if true}}
              <section>
                {{#if true}}
                  <p>{{#if true}} Paragraph Content {{/if}}</p>
                {{/if}}
              </section>
            {{/if}}
          {{/if}}
          </header>
        </body>
      STR
    end

    def hidden_content
      <<-STR
				<body>
        {{#unless true}}
          <section id="hidden">Hidden Content</section>
        {{/unless}}
				</body>
      STR
    end

    def loop_content
      <<-STR
      <body>
      {{#loop item in collection}}
        <p>Loop Content</p>
      {{/loop}}
      </body>
      STR
    end
end
