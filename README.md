# Cerubis

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
