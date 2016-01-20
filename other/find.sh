#!/bin/bash

arr=( $(find . -type f) )

echo ${#arr[@]}
echo ${arr[@]}
