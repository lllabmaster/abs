#!/bin/bash

LOG=$0.log
COMMAND1="sleep 100"

# So they can be monitored, and killed as necessary.
echo "Logging PIDs background commands for script: $0" >> "$LOG"

# Logging commands.
echo -n "PID of \"$COMMAND1\": " >> "$LOG"
${COMMAND1} & echo $! >> "$LOG"
echo >> "$LOG"

exit 0
