#!/bin/bash

AWKSCRIPT=' { srand(); print int(rand() * 100) } '

echo | awk "$AWKSCRIPT"

exit 0
