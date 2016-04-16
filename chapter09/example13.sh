#!/bin/bash

# If $IFS set, but empty,
#+ then "$*" and "$@" do not echo positional params as expected.

mecho()
{
    echo "$1,$2,$3";
}

IFS=""      # Set, but empty.

set a b c   # Positional parameters.

mecho $*    # a,b,c
mecho "$*"  # abc,,

mecho $@    # a,b,c
mecho "$@"  # a,b,c

# The behavior of $* and $@ when $IFS is empty depends on
#+ whatever Bash or sh version being run.
# It is therefore inadvisable to depend on this "feature" in a script.

exit 0
