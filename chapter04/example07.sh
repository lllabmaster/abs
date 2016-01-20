#!/bin/bash
# Using 'shift' to step through all the positional parameters.

until [ -z "$1" ]  # Until all parameters used up ...
do
    echo -n "$1 "
    shift
done

echo               # Extra line feed.

exit 0
