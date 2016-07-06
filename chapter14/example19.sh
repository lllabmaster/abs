#!/bin/bash

variable="one two three four five"

set -- $variable  # Set positional parameters.

first_param=$1
second_param=$2

shift; shift      # Shift past first two positional params.

remaining_params="$*"

echo
echo "first parameter = $first_param"
echo "second parameter = $second_param"
echo "remaining parameters = $remaining_params"
echo

# Again.
set -- $variable
first_param=$1
second_param=$2
echo "first parameter = $first_param"
echo "second parameter = $second_param"

set --   # Unsets positional parameters if no variable specified.

first_param=$1
second_param=$2
echo "first parameter = $first_param"
echo "second parameter = $second_param"

exit 0
