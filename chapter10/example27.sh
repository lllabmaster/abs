#!/bin/bash

# Crude address database.

clear # Clear the screen.

echo "         Contact List"
echo "         ------- ----"
echo "Choose one of the following persons:"
echo
echo "[E]vans, Roland"
echo "[J]ones, Mildred"
echo "[S]mith, Julie"
echo "[Z]ane, Morris"
echo

read person

case "$person" in
    "E" | "e" )  # Accept upper or lowercase input.
	echo
	echo "Roland Evans"
	;;       # Note double semicolon to terminate each option.
    "J" | "j" )
	echo
	echo "Mildred Jones"
	;;
    *         )
	echo
	echo "Not yet in database."
	;;
esac

echo

exit 0
