#!/bin/bash

PASSES=500   # Number of particle interactions / marbles.
ROWS=10      # Number of "collisions" (or horizontal peg rows).
RANGE=3      # We want 0 - 2 output range from $RANDOM.
POS=0        # Left/Right position.

declare -a Slots   # Array holding cumulative results of passes.
NUMSLOTS=21        # How many slots at bottom of board.

Initialize_Slots() # Zero out all elements of array.
{
    for i in $( seq $NUMSLOTS )
    do
	Slots[$i]=0
    done

    echo           # Blank line at beginning of run.
}

Show_Slots()
{
    echo -n " "
    for i in $( seq $NUMSLOTS )    # Pretty-point array elements.
    do
	printf "%3d" ${Slots[$i]}  # Three spaces per result.
    done

    echo # Row of slots:
    echo " |__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|"
    echo "                                ^^"
    echo
}

Move()                  # Move one unit right / left, or stay put.
{
    Move=$RANDOM        # How random is $RANDOM? Let's see.
    let "Move %= RANGE" # Normalize into range of 0 - 2.
    case "$Move" in
	0) ;;
	1) (( POS-- ));;
	2) (( POS++ ));;
	*) echo -n "Error ";;
    esac
}

Play()
{
    i=0
    while [ $i -lt $ROWS ]
    do
	Move
	(( i++ ));
    done

    SHIFT=11
    let "POS += SHIFT"
    (( Slots[$POS]++ ))
}

Run()
{
    p=0
    while [ $p -lt $PASSES ]
    do
	Play
	(( p++ ))
	POS=0
    done
}

# main
Initialize_Slots
Run
Show_Slots

exit $?
