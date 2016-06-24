#!/bin/bash

while read key
      [ "$key" != 'X' ]
do
    case "$key" in
	[[:lower:]]  ) echo "Lowercase letter";;
	[[:upper:]]  ) echo "Uppercase letter";;
	[0-9]        ) echo "Digit";;
	*            ) echo "Punctuation, whitespace, or other";;
    esac
done

exit 0
