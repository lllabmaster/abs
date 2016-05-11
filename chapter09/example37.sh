#!/bin/bash

declare -i number

number=3
echo "Number = $number"

number=three
echo "Number = $number"  # Number = 0

echo

#  Certain arithmetic operations are premitted for declared integer variables
#+ without the need for `expr` or `let`

n=6/3
echo "n = $n"  # n = 6/3

declare -i n
n=6/3
echo "n = $n"  # n = 2

exit 0
