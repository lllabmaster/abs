#!/bin/bash
# Invoke with ./scriptname 1 2 3 4 5

echo "$@"  # 1 2 3 4 5

shift
echo "$@"  # 2 3 4 5

shift
echo "$@"  # 3 4 5

exit 0
