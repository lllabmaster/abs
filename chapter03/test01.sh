#!/bin/bash

File=./example01.sh

{
    read line1
    read line2
} < $File

echo "line1: $line1"
echo "line2: $line2"
