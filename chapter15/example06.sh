#!/bin/bash

#  Copy all files in current directory ($PWD)
#+ to directory specified on command line.

E_NOARGS=65

if [ -z "$1" ]   # Exit if no argument given.
then
    echo "Usage: `basename $0` directory-to-copy-to"
    exit $E_NOARGS
fi

ls . | xargs -i -t cp ./{} $1

# -t is "verbose" option.
# Print the command line on the standard error output before executing it.

# -i is "replace strings" option.
# {} is a placeholder for output text.
# This is similar to the use of a curly bracket pair in "find".

exit 0
