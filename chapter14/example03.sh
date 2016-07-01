#!/bin/bash

E_BADDIR=65

var=nonexistent_directory

error()
{
    printf "$@" >&2
    echo
    exit $E_BADDIR
}

cd $var || error $"Can't cd to %s." "$var"

exit 0
