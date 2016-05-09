#!/bin/bash

String=23skidool
#      012345678  Bash
#      123456789  awk

echo ${String:2:4} # skid

# The awk equivalent of ${string:pos:length} is substr(string,pos,length).
echo | awk '
{
  print substr("'"${String}"'",3,4) # skid
}
'

#  Piping an empty "echo" to awk gives it dummy input,
#+ and thus makes it unnecessary to supply a filename.

exit 0
