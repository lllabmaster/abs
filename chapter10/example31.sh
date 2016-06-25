#!/bin/bash

# Using command substitution to generate a "case" variable.

case $( arch ) in
    i386 )
	echo "80386-based machine."
	;;
    i486 )
	echo "80486-based machine."
	;;
    i586 )
	echo "Pentium-based machine."
	;;
    i686 )
	echo "Pentium2+-based machine."
	;;
    *    )
	echo "Other type of machine."
esac

exit 0
