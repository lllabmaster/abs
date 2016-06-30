#!/bin/bash

z=1
z=`expr $z + 3`
echo $z

echo

z=$(( $z + 3 ))
echo $z

echo

z=$(( z + 3 ))   # Also correct.
echo $z

echo

let z=z+3
echo $z

echo

let "z += 3"
echo $z

echo

exit 0
