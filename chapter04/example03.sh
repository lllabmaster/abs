#!/bin/bash

a=23    # Simple case
echo $a
b=$a
echo $b

# Now, getting a little bit fancier (command substitution).

a=`echo Hello!`  # Assigns result of 'echo' command to 'a'.
echo $a

a=`ls -l`  # Assigns result of 'ls -l' command to 'a'
echo $a    # Unquoted, however, removes tabs and newlines.
echo
echo "$a"  # The quoted variable preserves whitespace.

R=$(cat ./example03.sh)
echo $R

echo

arch=$(uname -m)
echo "$arch"

exit 0
