#!/bin/bash

# Generating an 8-character "random" string.

if [ -n "$1" ]  # If command line argument present,
then            # Then set start-string to it.
    str0="$1"
else            # Else use PID of script as start-string.
    str0="$$"
fi

POS=2  # Starting at position 2 in the string.
LEN=8  # Extract eight characters.

str1=$( echo "$str0" | md5sum | md5sum )

randstring="${str1:$POS:$LEN}"

echo "$randstring"

exit $?
