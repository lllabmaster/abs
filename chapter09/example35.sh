#!/bin/bash

# Demo of pattern replacement at prefix / suffix of string.

v0=abc1234zip1234abc  # Original variable.
echo "v0 = $v0"
echo

# Match at prefix (beginning) of string.
v1=${v0/#abc/ABCDEF}  # ABCDEF1234zip123abc
echo "v1 = $v1"

# Match at suffix (end) of string.
v2=${v0/%abc/ABCDEF}  # abc1234zip1234ABCDEF
echo "v2 = $v2"

echo

#  Must match at beginning / end of string,
#+ otherwise no replacement results.
v3=${v0/#123/000}     # Matches, but not at beginning.
echo "v3 = $v3"       # abc1234zip1234abc

v4=${v0/%123/000}     # Matches, but not at end.
echo "v4 = $v4"       # abc1234zip1234abc

exit 0
