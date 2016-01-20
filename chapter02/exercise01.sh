#!/bin/bash

# Show the time and date.
date > andy.log

# List all logged-in users.
who  >> andy.log

# Show the system uptime.
uptime >> andy.log

exit 0
