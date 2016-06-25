#!/bin/bash

# Command-line parameter handling.

E_CONFFILE=1

while [ $# -gt 0 ]
do
    case "$1" in
	-d|--debug)
	    DEBUG=1
	    ;;
	-c|--conf )
	    CONFFILE="$2"
	    shift
	    if [ ! -f $CONFFILE ]; then
		echo "Error: Supplied file doesn't exist!"
		exit $E_CONFFILE   # File not found error.
	    fi
	    ;;
    esac
    shift   # Check next set of parameters.
done

exit 0
