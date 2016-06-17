#!/bin/bash

# Listing the planets.

for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
do
    echo $planet
done

echo

for planet in "Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto"
do
    echo $planet

    set -- $planet

    echo

    echo "$1 $2 $3"
    echo "$4 $5 $6"
    echo "$7 $8 $9"
done

exit 0
