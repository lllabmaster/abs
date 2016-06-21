#!/bin/bash

# Count to 10 in a "while" loop.

a=1
LIMIT=10

while [ "$a" -le $LIMIT ]
do
    echo -n "$a "
    let "a+=1"
done

echo; echo

# Now, repeat with C-like syntax.

(( a = 1 ))

while (( a <= LIMIT ))
do
    echo -n "$a "
    (( a += 1 ))
done

echo

exit 0
