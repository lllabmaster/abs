#!/bin/bash

# Problems reading from a pipe.

last="(null)"

cat "$0" |
    while read line
    do
	echo "{$line}"
	last=$line
    done

printf "\nAll done, last:$last\n"

exit 0
