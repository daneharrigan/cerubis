require 'test_helper'

class RenderedTest < MiniTest::Unit::TestCase
  def test_render_single_block
    template = Cerubis.render(content)
    html = Capybara::Node::Simple.new(template.to_html)

    assert html.has_selector?('body > section', text: 'Foo Content')
  end

  def test_render_nested_blocks
    template = Cerubis.render(nested_content)
    html = Capybara::Node::Simple.new(template.to_html)

    assert html.has_selector?('body > header > h1', text: 'Header Content')
    assert html.has_selector?('body > header > section > p', text: 'Paragraph Content')

    refute html.has_selector?('body > header > #hidden', text: 'Hidden Content')
    refute_match /\{\{/, template.to_html
  end

  def test_render_unless_block
    template = Cerubis.render(hidden_content)
    html = Capybara::Node::Simple.new(template.to_html)

    refute html.has_selector?('body > #hidden', text: 'Hidden Content')
    refute_match /\{\{/, template.to_html
  end

  def test_render_loop_block
    $BREAK = true
    template = Cerubis.render(loop_content, collection: [1,2,3])
    html = Capybara::Node::Simple.new(template.to_html)

    assert html.has_selector?('p', text: 'Loop Content: 1')
    assert html.has_selector?('p', text: 'Loop Content: 2')
    assert html.has_selector?('p', text: 'Loop Content: 3')
    refute_match /\{\{/, template.to_html
  end

  def test_render_foo_helper
    template = Cerubis.render(helper_content, item: 'Item Value')
    assert_equal '<p>*Foo* Item Value *Foo*</p>', template.to_html.strip
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
        <p>Loop Content: {{ item }}</p>
      {{/loop}}
      </body>
      STR
    end

    def helper_content
      <<-STR
        <p>{{ foo_helper item }}</p>
      STR
    end
end
