#!/bin/bash

# Inserting a blank line between paragraphs of a single-spaced text file.
# Usage: $0 < FILENAME

# Assume lines shorter than $MINLEN characters terminate a paragraph.
MINLEN=50

while read line
do
    echo "$line"
    len=${#line}
    if [ "$len" -lt "$MINLEN" ]
    then
	echo
    fi
done

exit 0
