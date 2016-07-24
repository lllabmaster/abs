#!/bin/bash

len=$(expr length "$1")
shead=$(expr substr "$1" 1 1)
stail=$(expr substr "$1" 2 $(( len - 1 )))

result=$(echo $shead | tr 'a-z' 'A-Z')$(echo $stail | tr 'A-Z' 'a-z')

echo $result

exit 0
