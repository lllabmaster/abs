#!/bin/bash

# Crude word frequency analysis on a text file.
# Uses 'xargs' to decompose lines of text into single words.

ARGS=1
E_BADARGS=65
E_NOFILE=66

if [ $# -ne "$ARGS" ]
then
    echo "Usage: `basename $0` filename."
    exit $E_BADARGS
fi

if [ ! -f "$1" ]    # Check if file exists.
then
    echo "File \"$1\" does not exist."
    exit $E_NOFILE
fi

cat "$1" | xargs -n1 | tr A-Z a-z | \
    sed -e 's/\.//g' -e 's/\,//g' -e 's/ //g' | \
    sort | uniq -c | sort -nr

exit 0
