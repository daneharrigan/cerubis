# Cerubis TODO

## Hash arguments

Helpers only support an argument list. They don't support hashes.
Blocks don't support hashes either. I think it'll be harder to add hash
support to blocks than to helpers, but I see value in adding it to both.

## Refactors

The `Cerubis::Parser#nested_block?` and `Cerubis::Parser#blocks_not_closed?`
methods are very similar. I think they can be consolidated.

Registered helpers should not be loaded into `Cerubis::Helper` all at
once. Approach this with a DCI style.

    # single helper
    Cerubis.register_helper :foo_helper, FooHelper

    # multiple helpers in one module
    Cerubis.register_helper :foo_helper, :bar_helper, GroupHelper

Switch hash syntax from 1.9 to 1.8 for support on all Ruby VMs
