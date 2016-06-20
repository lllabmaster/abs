#!/bin/bash

# Two ways to count up to 10.

echo

# Standard syntax.
for a in $(seq 10)
do
    echo -n "$a "
done

echo; echo

# +==============================+

# Now, let's do the same, using C-like syntax.

LIMIT=10

for (( a = 1; a <= LIMIT; a++ ))  # Double parentheses, and "LIMIT" with no "$".
do
    echo -n "$a "
done

echo; echo

# +==============================+

for (( a = 1, b = 1; a <= LIMIT; a++, b++ ))
do
    echo -n "$a-$b "
done

echo; echo

exit 0
