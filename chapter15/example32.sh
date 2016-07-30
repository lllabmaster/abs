#!/bin/bash

# Strips out the comments (/* COMMENT */) in a c program.

E_NOARGS=0
E_ARGERROR=66
E_WRONG_FILE_TYPE=67

if [ $# -eq "$E_NOARGS" ]
then
    echo "Usage: `basename $0` program.c" >&2  # Error message to stderr.
    exit $E_ARGERROR
fi

# Test for correct file type.
type=`file $1 | awk '{print $2, $3, $4, $5}'`
correct_type="C source, ASCII text"

if [ "$type" != "$correct_type" ]
then
    echo
    echo "This script works on C program files only."
    echo
    exit $E_WRONG_FILE_TYPE
fi

sed '
/^\/\*/d
/.*\*\//d
' $1

exit 0
