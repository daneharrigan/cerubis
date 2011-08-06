# Cerubis [![Test Status](https://secure.travis-ci.org/daneharrigan/cerubis.png)][3]

*WARNING:* Cerubis is still under initial development. Most features are
not functional yet.

Cerubis is inspired by [Liquid Markup][1] and [Mustache][2]. I like how
Mustache syntax looks, but it's logic-less. Liquid allows just enough
logic, but I don't like the syntax. And so Cerubis was born.

## Syntax

A block is started with `{{# ... }}` and closed with `{{/ ... }}`.
Output is defined as `{{ ... }}`.

    <header>
      <h1>{{ page.title }}</h1>
      {{#unless navigation.empty?}}
      <menu>
        {{#loop nav in navigation}}
        <li>{{ link_to page }}</li>
        {{/loop}}
      </menu>
      {{/unless}}
    </header>

## Standard Blocks

* if
* unless
* loop

## Objects in Template Context

Rendering a Cerubis template with objects in the context is easy:

    template_str = <<-STR
      {{#if items.empty?}}
        <p>There are no items!</p>
      {{/if}}
    STR

    context = { items: [1,2,3] }

    Cerubis.render(template_str, context)

You can create your own objects and add them to template context, but
you need to make Cerubis aware of the methods it's allowed to call:

    class Foo
      include Cerubis::Method
      cerubis_method :foo, :bar, :baz

      def foo; "Foo Method"; end
      def bar; "Bar Method"; end
      def baz; "Baz Method"; end
    end

    template_str = "<some-template-text>"
    context      = { foo: Foo.new }

    Cerubis.render(template_str, context)

Shown above, object methods are made available to Cerubis templates by
indicating them with `cerubis_method`. The `cerubis_method` can have
many method names passed to it and `cerubis_method` can be called
multiple times.

## Testing

You can run the tests in a few different ways. First, you've got your
standard ruby way:

    ruby -Ilib:test test/cerubis_test.rb
    ruby -Ilib:test test/all.rb

Or you can use a few Thor commands:

    thor test:file cerubis
    thor test:file cerubis/matcher
    thor test:all

[1]: http://github.com/shopify/liquid
[2]: http://github.com/defunkt/mustache
[3]: https://secure.travis-ci.org/daneharrigan/cerubis
