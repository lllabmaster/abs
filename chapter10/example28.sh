#!/bin/bash

while read person
      [ "$person" != 'X' ]
do
    case "$person" in
	"E" | "e" )
	    echo "Roland Evans"
	    echo
	    ;;
	"J" | "j" )
	    echo "Mildred Jones"
	    echo
	    ;;
	*         )
	    echo "Not yet in database."
	    echo
	    ;;
    esac
done

exit 0
