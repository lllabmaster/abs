#!/bin/bash

# Variables: assignment and substitution.

a=375
hello=$a

echo hello
echo ${hello}
echo "$hello"
echo "${hello}"

echo

# Quoting a variable preserve whitespace.
hello="A B  C   D"
echo $hello
echo "$hello"
echo '$hello'

echo

# Setting it to a null value.
hello=
echo "\$hello (null value) = $hello"

echo

var1=21 var2=22 var3=$V3
echo "var1=$var1 var2=$var2 var3=$var3"

echo; echo

# If there is whitespace embedded within a variable, then quotes are necessary.
numbers="one two three"
other_numbers="1 2 3"
echo "numbers = $numbers"
echo "other_numbers = $other_numbers"
echo

# Escaping the whitespace also works.
mixed_bag=2\ ---\ Whatever
echo "$mixed_bag"
echo; echo

echo "uninitiallized_variable = $uninitiallized_variable"
uninitiallized_variable=
echo "uninitiallized_variable = $uninitiallized_variable"
uninitiallized_variable=23

unset uninitiallized_variable
echo "uninitiallized_variable = $uninitiallized_variable"

exit 0
