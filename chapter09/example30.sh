#!/bin/bash

# Parameter substitution and "usage" messages.

: ${1?"Usage: $0 ARGUMENT"}
#  Script exits here if command-line parameter absent,
#+ with following error message.
#  xxx.sh: 1: Usage: xxx.sh ARGUMENT

echo "This two lines echo only if command-line parameter given."
echo "command line parameter = \"$1\""

exit 0
