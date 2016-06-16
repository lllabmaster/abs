#!/bin/bash

# Planets revisited.
# Associate the name of each planet with its distance from the sun.

for planet in "Mercury 36" "Venus 67" "Earth 93" "Mars 142" "Jupiter 483"
do
    set -- $planet   #  Parses variable "planet"
                     #+ and sets positional parameters.
    #  The "--" prevents nasty surprises if $planet is null or
    #+ begins with a dash.
    
    echo "$1 $2,000,000 miles from the sun"
done

exit 0
