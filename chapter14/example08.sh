#!/bin/bash

# Detects the arrow keys, and a few more.

arrowup='\[A'
arrowdown='\[B'
arrowright='\[C'
arrowleft='\[D'

insert='\[2'
delete='\[3'

SUCCESS=0
OTHER=65

echo -n "Press a key... "
read -n3 key                     # Read 3 characters.

echo -n "$key" | grep "$arrowup" # Check if character code detected.
if [ "$?" -eq $SUCCESS ]
then
    echo "Up-arrow key pressed."
    exit $SUCCESS
fi

echo -n "$key" | grep "$arrowdown"
if [ "$?" -eq $SUCCESS ]
then
    echo "Down-arrow key pressed."
    exit $SUCCESS
fi

echo -n "$key" | grep "$arrowright"
if [ "$?" -eq $SUCCESS ]
then
    echo "Right-arrow key pressed."
    exit $SUCCESS
fi

echo -n "$key" | grep "$arrowleft"
if [ "$?" -eq $SUCCESS ]
then
    echo "Left-arrow key pressed."
    exit $SUCCESS
fi

echo -n "$key" | grep "$insert"
if [ "$?" -eq $SUCCESS ]
then
    echo "\"Insert\" key pressed."
    exit $SUCCESS
fi

echo -n "$key" | grep "$delete"
if [ "$?" -eq $SUCCESS ]
then
    echo "\"Delete\" key pressed."
    exit $SUCCESS
fi

echo " Some other key pressed."

exit $OTHER
