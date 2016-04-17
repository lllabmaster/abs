#!/bin/bash

REGX='abc[A-Z]*..3'
STRING='abcABC123ABCabc'

echo `expr $STRING : $REGX`
echo `expr match $STRING $REGX`

exit 0
