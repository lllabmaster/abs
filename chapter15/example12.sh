#!/bin/bash

# Crude word frequency analysis on a text file.

# Check for input file on command line.
ARGS=1
E_BADARGS=65
E_NOFILE=66

if [ $# -ne "$ARGS" ]
then
    echo "Usage: `basename $0` filename"
    exit $E_BADARGS
fi

if [ ! -f "$1" ]
then
    echo "File \"$1\" does not exist."
    exit $E_NOFILE
fi

sed -e 's/\.//g' -e 's/\,//g' -e 's/"//g' \
    -e 's/+//g'  -e 's/\$//g' -e 's/!//g' \
    -e 's/ /\
/g'  -e 's/#//g'  -e 's/\;//g' "$1" \ # change space between words to linefeed.
    | tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr
						    
exit 0
