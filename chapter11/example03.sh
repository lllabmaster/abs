#!/bin/bash

E_NOARGS=66
E_BADARG=67
MINLEN=7

if [ -z "$1" ]
then
    echo "Usage $0 LETTERSET."
    exit $E_NOARGS
elif [ ${#1} -lt $MINLEN ]
then
    echo "Argument must have at least $MINLEN letters."
    exit $E_BADARG
fi

FILTER='.......'
Anagrams=( $(echo $(anagram $1 | grep $FILTER)) ) # What's `anagram` ???!!!

echo
echo "${#Anagrams[*]}  7+ letter anagrams found."
echo

echo ${Anagrams[0]}
echo ${Anagrams[1]}

exit $?
