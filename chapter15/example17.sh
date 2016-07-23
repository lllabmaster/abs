#!/bin/bash

# Enulates the useful "from" utility in Solaris, BSD, etc.
# Echoes the "From" header line in all messages in your e-mail directory.

MAILDIR=~/mail/*             #  No quoting of variable.
GREP_OPTS="-H -A 5 --color"  #  Show file, plus extra context lines
                             #+ and display "From" in color.
TARGETSTR="^From"            #  "From" at beginning of line.

for file in $MAILDIR
do
    grep $GREP_OPTS "$TARGETSTR" "$file"
    echo
done

exit $?
