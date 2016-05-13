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

}
