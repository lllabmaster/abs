#!/bin/bash

AWKSCRIPT=' { srand(); print 100 * rand() } '

echo | awk "$AWKSCRIPT"

exit 0
