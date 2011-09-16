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

  def test_render_loop_nested_blocks
    template = Cerubis.render(loop_nested_content, collection: [1,2,3])
    html = Capybara::Node::Simple.new(template.to_html)

    assert html.has_selector?('body > header > ul > li', text: '1')
    assert html.has_selector?('body > header > ul > li', text: '2')
    assert html.has_selector?('body > header > ul > li', text: '3')

    refute_match /\{\{/, template.to_html
  end

  def test_render_unless_block
    template = Cerubis.render(hidden_content)
    html = Capybara::Node::Simple.new(template.to_html)

    refute html.has_selector?('body > #hidden', text: 'Hidden Content')
    refute_match /\{\{/, template.to_html
  end

  def test_render_loop_block
    template = Cerubis.render(loop_content, collection: [1,2,3])
    html = Capybara::Node::Simple.new(template.to_html)

    assert html.has_selector?('p', text: 'Loop Content: 1')
    assert html.has_selector?('p', text: 'Loop Content: 2')
    assert html.has_selector?('p', text: 'Loop Content: 3')
    refute_match /\{\{/, template.to_html
  end

  def test_render_foo_helper
    Cerubis.register_helper :foo_helper, FooHelper
    template = Cerubis.render(helper_content, item: 'Item Value')
    assert_equal '<p>** Item Value **</p>', template.to_html.strip
  end

  def test_helper_syntax_error
    assert_raises Cerubis::SyntaxError do
      Cerubis.register_helper :foo_helper, FooHelper
      template = Cerubis.render(helper_content_error)
      template.to_html
    end
  end

  def test_render_static_content
    template = Cerubis.render(static_content)
    assert_equal '<p>Static Content</p>', template.to_html.strip
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
            <section>
              {{#unless false}}
                <p>{{#if true}} Paragraph Content {{/if}}</p>
              {{/unless}}
            </section>
          {{/if}}
          </header>
        </body>
      STR
    end

    def loop_nested_content
      <<-STR
      <body>
        {{#if true}}
          <header>
            {{#unless false}}
              <ul>
                {{#loop item in collection}}
                  <li>{{item}}</li>
                {{/loop}}
              </ul>
            {{/unless}}
          </header>
        {{/if}}
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

    def helper_content_error
      <<-STR
      {{ foo_helper 'bar', 'baz' }}
      STR
    end

    def static_content
      <<-STR
        <p>Static Content</p>
      STR
    end

    module FooHelper
      def foo_helper(value)
        "** #{value} **"
      end
    end
end
