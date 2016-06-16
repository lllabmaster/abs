#!/bin/bash

# Manipulating a variable, C-style, using the ((...)) construct.

echo

(( a = 23 ))  #  Setting a value, C-style,
              #+ with spaces on both sides of the "=".

echo "a (initial value) = $a"

(( a++ ))     #  Post-increment 'a', C-style.
echo "a (after a++) = $a"

(( a-- ))     #  Post-decrement 'a', C-style.
echo "a (after a--) = $a"

(( ++a ))     #  Pre-increment 'a', C-style.
echo "a (after ++a) = $a"

(( --a ))     #  Pre-decrement 'a', C-style.
echo "a (after --a) = $a"

echo

(( t = a < 45 ? 7 : 11 ))   # C-style trinary operator.
echo "t = $t"

echo

exit 0
