# Cerubis TODO

## Hash arguments

Helpers only support an argument list. They don't support hashes.
Blocks don't support hashes either. I think it'll be harder to add hash
support to blocks than to helpers, but I see value in adding it to both.

## Refactors

The `Cerubis::Parser#nested_block?` and `Cerubis::Parser#blocks_not_closed?`
methods are very similar. I think they can be consolidated.

Switch hash syntax from 1.9 to 1.8 for support on all Ruby VMs
