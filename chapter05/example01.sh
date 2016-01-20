#!/bin/bash
# Echoing weird variables.

var="'(]\\{}\$\""
echo $var     # '(]\{}\$"
echo "$var"   # '(]\{}\$"   Doesn't make a difference.

echo

IFS='\'
echo $var     # '(] {}$" \ converted to space.
echo "$var"   # '(]\{}$"

exit 0
