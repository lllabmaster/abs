#!/bin/bash

params=$#   # Number of command-line parameters.
param=1     # Start at first command-line param.

while [ "$param" -le "$params" ]
do
    echo -n "Command line parameter "
    echo -n \$$param
    echo -n " = "
    eval echo \$$param

    let "param += 1"
done

exit $?
