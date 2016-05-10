#!/bin/bash

# Pattern matching using the # ## % %% parameter substitution operators.

var1=abcd12345abc6789
pattern1=a*c  # * (wild card) matches everything between a - c.

echo
echo "var1 = $var1"    # abcd12345abc6789
echo "var1 = ${var1}"  # abcd12345abc6789

echo "Number of characters in ${var1} = ${#var1}"
echo

echo "pattern1 = $pattern1" # a*c
echo "--------------"
echo '${var1#$pattern1} =' "${var1#$pattern1}"   # d12345abc6789
echo '${var1##$pattern1} =' "${var1##$pattern1}" # 6789
echo; echo; echo

pattern2=b*9
echo '${var1%$pattern2} =' "${var1%$pattern2}"   # abcd12345a
echo '${var1%%$pattern2} =' "${var1%%$pattern2}" # a

echo

exit 0
