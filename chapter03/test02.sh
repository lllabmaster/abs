#!/bin/bash

# This script tests code block.

E_NOARGS=65

if [ -z "$1" ]
then
    echo "Usage: `basename $0` name."
    exit $E_NOARGS
fi

{ # Begin Code Block.
    echo "Greetings:"
    if [ "$1" == "andy" ]
    then
        echo "Hello Master andy."
    else
        echo "Hello Guest."
    fi
} > greeting.txt

echo "Results are in file greeting.txt"

exit 0
