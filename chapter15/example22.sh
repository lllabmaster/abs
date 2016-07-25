#!/bin/bash

file=words.data

while read word && [[ $word != end ]]
do
    if look "$word" > /dev/null
       then echo "\"$word\" is valid."
       else echo "\"$word\" is invalid."
    fi
done < "$file"

exit 0
