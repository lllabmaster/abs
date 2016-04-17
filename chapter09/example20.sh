#!/bin/bash

STR='abcABC123ABCabc'

echo ${STR:0}    # abcABC123ABCabc
echo ${STR:1}    # bcABC123ABCabc
echo ${STR:7}    # 23ABCabc

echo ${STR:7:3}  # 23A

echo ${STR: -4}  # Cabc
echo ${STR:(-4)} # Cabc

exit 0
