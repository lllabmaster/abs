#!/bin/bash

PI=3.14159265358979
DecimalConstant=31373
Message1="Greetings,"
Message2="Earthling."

echo

printf "Pi to 2 decimal places = %1.2f" $PI
echo

printf "Pi to 9 decimal places = %1.9f" $PI
printf "\n"

printf "Constant = \t%d\n" $DecimalConstant

printf "%s %s \n" $Message1 $Message2
echo

echo

PI12=$(printf "%1.12f" $PI)
echo "Pi to 12 decimal places = $PI12"

MSG=`printf "%s %s \n" $Message1 $Message2`
echo $MSG;
echo $MSG

exit 0
