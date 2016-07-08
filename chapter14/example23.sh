#!/bin/bash

# Same effect as "source data-file", but more portable.
. data-file    # Load a data file.

# Now, reference some data from that file.
echo "variable1 (from data-file) = $variable1"
echo "variable3 (from data-file) = $variable3"

let "sum = $variable2 + $variable4"
echo "Sum of variable2 + variable4 (from data-file) = $sum"

echo "message1 (from data-file) is \"$message1\""

print_message 'This is the message-print function in the data-file.'

exit 0
