#!/bin/bash

# Substring Removal.

stringZ=abcABC123ABCabc

# Strip out shortest match between 'a' and 'C'.
echo ${stringZ#a*C}  # 123ABCabc

# Strip out longest match between 'a' and 'C'.
echo ${stringZ##a*C} # abc

# Strip out shortest match between 'b' and 'c', from back of $stringZ.
echo ${stringZ%b*c}  # abcABC123ABCa

# Strip out longest match between 'b' and 'c', from back of $stringZ.
echo ${stringZ%%b*c} # a

exit 0
