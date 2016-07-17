#!/bin/bash

# Killing processes by name.
# This is a fairly dangerous script.

E_BADARGS=65

if test -z "$1"
then
    echo "Usage: `basename $0` Process(es)_To_Kill"
    exit $E_BADARGS
fi

PROCESS_NAME="$1"
ps ax | grep "$PROCESS_NAME" | awk '{print $1}' | xargs -i kill {} 2&>/dev/null

# Notes:
# -i is the "replace strings" option to xargs.
# The curly brackets are the placeholder for the replacement.
# 2&>/dev/null suppresses unwanted error messages.

exit $?
