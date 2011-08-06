# Cerubis TODO

## Limit available object methods

At the moment any object in the template context have all methods
exposed. I'm thinking about adding a class level method to `Object`
like:

    class Foo
      cerubis :meth_1, :meth_2

      def meth_1; end
      def meth_2; end
    end

Or...

    class Bar
      cerubis_method :meth_1, :meth_2

      def meth_1; end
      def meth_2; end
    end

Another thought is to expose the methods through a module that can be
included into any class you'd like to add to a context:

    class Baz
      include CerubisMethod
      cerubis_method :meth_1, :meth_2

      def meth_1; end
      def meth_2; end
    end

## Parse helpers

I want to only make helpers available in output tags, `{{ .. }}`, so
that means they cant be used in opening blocks.

I unsure whether or not parenthesis should be required, optional or even
possible. I think I'd like to start going down the road of requiring
them and if I can easily make them optional then offer that.

Here is a single helper example:

    <header>
      <h1>{{ uppercase(page.title) }}</h1>
    </header>

And here's a few:

    {{ foo(bar(baz(page.title))) }}

The parenthesis can get a little ridiculous if you nest multiple
helpers. I can't see use case for this, but I want it to be possible.

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
