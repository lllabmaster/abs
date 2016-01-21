#!/bin/bash

true                                   # The "true" builtin.
echo "exit status of \"true\" = $?"    # 0

! true   # "!" needs a space between it and the command.
echo "exit status of \"! true\" = $?"  # 1
