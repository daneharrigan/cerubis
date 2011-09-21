# Cerubis TODO

## Hash arguments

Helpers only support an argument list. They don't support hashes.
Blocks don't support hashes either. I think it'll be harder to add hash
support to blocks than to helpers, but I see value in adding it to both.

    {{#form_for page, as: f}}
      {{f.text_field 'first_name', value: 'John'}}
      {{f.text_field 'last_name',  value: 'Smith'}}
      {{f.text_area  'comments',   value: 'Comments...'}}
      {{f.submit     'Send!',      id: 'comment-button'}}
    {{/form_for}}

The code above is an example of how I think I'd like the hash syntax to
work in `Cerubis`. Note that I the "as: f" key/value pair does not have
quotes around the "f." This is intentional, to indicate that the value
can be any item within the template context.

## Refactors

The `Cerubis::Parser#nested_block?` and `Cerubis::Parser#blocks_not_closed?`
methods are very similar. I think they can be consolidated.

Add backwards compatibility for 1.8.7/ree

## Test coverage

At the time of writing, `Cerubis` sits at 98.8% coverage and less than
400 LOC. I'd like to see the coverage brought to 100%.`
