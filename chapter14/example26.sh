#!/bin/bash

echo
echo "This line appears ONCE in the script, yet it keeps echoing."
echo "The PID of this instance of the script is still $$."

echo "============= Hit Ctrl-C to exit ============="

sleep 1

exec bash $0

echo "This line will never echo!"

exit 99    # Will not exit here!
           # Exit code will not be 99!
