#!/bin/bash

# Using the `declare' builtin restricts the scope of a variable.

foo()
{
    FOO="bar"
}

bar()
{
    foo
    echo $FOO
}

bar  # Prints bar.

echo

foo2()
{
    declare FOO2="bar"
}

bar2()
{
    foo2
    echo $FOO2
}

bar2 # Prints nothing.

exit 0
