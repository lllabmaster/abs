#!/bin/bash

# A script that kills itself.

kill $$   # Script kills its own process here.
          # Recall that "$$" is the script's PID.

echo "This line will not echo."

exit 0    # Normal exit? No!
