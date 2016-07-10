#!/bin/bash

# A script sourcing itself "recursively."

MAXPASSCNT=100   # Maximum number of execution passes.

echo -n "$pass_count  "
let "pass_count += 1"

while [ "$pass_count" -le $MAXPASSCNT ]
do
    . $0  # Script "sources" itself, rather than calling itself.
done

echo      # The net effect is counting from 1 to 100.
          # Very impressive.

exit 0
