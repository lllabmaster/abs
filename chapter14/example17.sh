#!/bin/bash

# Invoke this script with three command line parameters.

echo
echo "Positional parameters before  set \`uname -a\` :"
echo "Command-line argument #1 = $1"
echo "Command-line argument #2 = $2"
echo "Command-line argument #3 = $3"

# The set command changes the value of internal script variables/options.
set `uname -a`

echo $_

echo "Positional parameters after set \`uname -a\` :"
echo "Field #1 of 'uname -a' = $1"
echo "Field #2 of 'uname -a' = $2"
echo "Field #3 of 'uname -a' = $3"

echo ---
echo $_
echo

exit 0
