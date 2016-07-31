#!/bin/bash

#  This script filters the output of "strings" by checking it against a
#+ standard word list file.

#  This effectively eliminates gibberish and noise, and outputs only
#+ recognized words.

ARGS=1
E_BADARGS=65
E_NOFILE=66

if [ $# -ne $ARGS ]
then
    echo "Usage: `basename $0` filename"
    exit $E_BADARGS
fi

if [ ! -f "$1" ]
then
    echo "File \"$1\" does not exist."
    exit $E_NOFILE
fi


MINSTRLEN=3                              # Minimum string length.
WORDFILE=/usr/share/dict/cracklib-small  # Dictionary file.

wlist=`strings "$1" | tr A-Z a-z | tr '[:space:]' Z | \
tr -cs '[:alpha:]' Z | tr -s '\173-\377' Z | tr Z ' '`

#  "tr A-Z a-z"           converts to lowercase.
#  "tr '[:space:]' Z"     converts whitespace characters to Z's.
#  "tr -cs '[:alpha:]' Z" converts non-alphabetic characters to Z's,
#+ and squeezes multiple consecutive Z's.
#  "tr -s '\173-\377' Z"  converts all characters past 'z' to Z's,
#+ and squeezes multiple consecutive Z's, which gets rid of all the
#+ weird characters that the previous translation failed to deal with.
#  "tr Z ' '" converts all those Z's to whitespace, which will be seen
#+ as word separators in the loop below.

for word in $wlist    # "$wlist" does not work.
	              #  $wlist must not be quoted here.
do
    strlen=${#word}   # String length.
    if [ "$strlen" -lt "$MINSTRLEN" ]
    then              # Skip over short strings.
	continue
    fi
                      #  Match whole words only.
                      # "Fixed strings" and "whole words" options.
    grep -Fw $word "$WORDFILE"
done

exit $?
