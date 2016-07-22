#!/bin/bash

# Generating 10-digit random numbers.

head -c 4 /dev/urandom | od -N4 -tu4 | sed -ne '1s/.* //p'

# Analysis

# head:
# -c 4 option takes first 4 bytes.

# od: dump files in octal and other formats.
# -N4  option limits dump to 4 input bytes.
# -tu4 option `output format` unsigned decimal, 4 bytes per integer.

exit 0
