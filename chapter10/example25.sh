#!/bin/bash

# Testing ranges of characters.

echo; echo "Hit a key, then hit return."

read keypress

case "$keypress" in
    [[:lower:]] ) echo "Lowercase letter";;  # POSIX is more portable.
    [[:upper:]] ) echo "Uppercase letter";;
    [0-9]       ) echo "Digit";;
    *           ) echo "Punctuation, whitespace, or other";;
esac

exit 0
