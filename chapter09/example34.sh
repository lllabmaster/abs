#!/bin/bash

var1=abcd-1234-defg
echo "var1 = $var1"

t=${var1#*-*}
echo "var1 (with everything, up to and including first - stripped out) = $t"
#  Since # matches the shortest string, and * matches everything preceding,
#+ including an empty string.

t=${var1##*-*}
echo "If var1 contains a \"-\", returns empty string... var1 = $t"

t=${var1%*-*}
echo "var1 (with everything from the last - on stripped out) = $t"

echo
