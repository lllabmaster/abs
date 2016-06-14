#!/bin/bash

# Returns a pseudorandom number in the range 0 - 1.
# Uses the awk rand() function.

AWKSCRIPT=' { srand(); print rand() } '

echo -n "Random number between 0 and 1 = "
echo | awk "$AWKSCRIPT"

exit 0
