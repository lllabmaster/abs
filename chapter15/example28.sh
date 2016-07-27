#!/bin/bash

# Encrypt quotes.

#  It will encrypt famous quotes in a simple monoalphabetic substitution.
#  The result is similar to the "Crypto Quote" puzzles seen in the Op Ed
#+ pages of the Sunday paper.

# The "key" is nothing more than a scrambled alphabet.
# Changing the "key" changes the encryption.
key=ETAOINSHRDLUBCFGJMQPVWZYXK

if [ "$2" = "decrypt" ]
then
    cat "$1" | tr "a-z" "A-Z" | tr "A-Z"  "$key"
else
    cat "$1" | tr "a-z" "A-Z" | tr "$key" "A-Z"
fi

exit 0
