#!/bin/bash

# Classic rot13 algorithm, encryption that might fool a 3-year old.

# Usage: bash rot13.sh filename
# or     bash rot13.sh < filename
# or     bash rot13.sh and supply keyboard input (stdin)

cat "$@" | tr 'a-zA-Z' 'n-za-mN-ZA-M'

exit 0
