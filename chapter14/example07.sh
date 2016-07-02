#!/bin/bash

# Read a keypress without hitting ENTER.

read -s -n1 -p "Hit a key " keypress
echo; echo "Keypress was "\"$keypress\""."

# -s option means do not echo input. silent.
# -n N option means accept only N characters of input.
# -p option means echo the following prompt before reading input.

exit 0
