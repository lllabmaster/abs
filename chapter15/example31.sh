#!/bin/bash

# This script echoes itself twice to stdout with its lines numbered.

# 'nl' sees this as line 3 since it does not number blank lines.
# 'cat -n' sees the above line as number 5.

nl `basename $0`

echo; echo

cat -n `basename $0`

exit 0
