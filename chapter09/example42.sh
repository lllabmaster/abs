#!/bin/bash

# Passing an indirect reference to awk.
# Using awk to caculate the sum value of a column of numbers.

ARGS=2
E_WRONGARGS=65

# Check for proper number of command line args.
if [ $# -ne "$ARGS" ]
then
    echo "Usage: `basename $0` filename column-number"
    exit $E_WRONGARGS
fi

filename=$1
column_number=$2

# Begin awk script.
awk "
{
    total += \$${column_number}  # indirect reference.
} END {
    print total
} " "$filename"
# End awk script.

exit 0
