#!/bin/bash

y=`eval ls -l`   # Similar to y=`ls -l`.
echo $y          # Linefeeds removed.
echo
echo "$y"        # Linefeeds preserved when variable is quoted.

echo; echo

y=`eval df`      # Similar to y=`df`.
echo $y          # Linefeeds removed.

#  When LF's not preserved, it may make it easier to parse output,
#+ using utilities such as "awk".

echo

for i in $(seq 5)
do
    eval value=$i
    echo $value
done

echo

for i in ls df
do
    value=eval $i
    echo $value
done

exit 0
