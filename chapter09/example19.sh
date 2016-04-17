#!/bin/bash

STR='abcABC123ABCabc'

echo `expr index $STR 'C12'` # 6
echo `expr index $STR '5c'`  # 3

exit 0
