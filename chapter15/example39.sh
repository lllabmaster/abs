#!/bin/bash

# Look up abuse contact to report a spammer.

# Check for command-line arg.
ARGCOUNT=1
E_WRONGARGS=65

if [ $# -ne "$ARGCOUNT" ]
then
    echo "Usage: `basename $0` domain-name"
    exit $E_WRONGARGS
fi

dig +short $1.contacts.abuse.net -c in -t txt

exit $?
