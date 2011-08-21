# Cerubis TODO

## Parse helpers

I want to only make helpers available in output tags, `{{ .. }}`, so
that means they cant be used in opening blocks.

I decided on not allowing parenthesis which makes nesting helpers pretty
difficult so I don't want to allow that either.

Here is a helper example:

    <header>
      <h1>{{ uppercase page.title }}</h1>
    </header>

Or without surrounding spaces:

    {{upcase page.title}}

## Make helpers available to templates

To add helpers to Cerubis templates you'll need to create a module with
the methods you'd like to make available as helpers. Then you'll need to
"register" it with Cerubis. Liquid Markup does the same thing, but they
call their helpers "filters."

    module FooHelpers
      def foo(arg); end
      def bar(arg); end
      def baz(arg); end
    end

    Cerubis.register_helpers FooHelpers
