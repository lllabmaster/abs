#!/bin/bash

i=0

echo

while [ "$var1" != "end" ]      # while test "$var1" != "end"
do
    echo "Input variable #$i (end to exit) "
    read var1                   # Not 'read $var1'
    echo "variable #$i = $var1"  # Need quotes because of "#" ...
    echo

    (( i++ ))
done

exit 0
