#!/bin/bash

#  Invoke this script both with and without arguments,
#+ and see what happens.

for a
do
    echo "$a "
done

#  The 'in list' missing, therefore the loop operates on '$@'
#+ (command-line argument list, including whitespace).

exit 0
