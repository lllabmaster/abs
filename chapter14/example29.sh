#!/bin/bash

if false
then
    echo "false evaluates \"true\""
else
    echo "false evaluates \"false\""
fi

while false
do
    echo "hello world!"  # Nothing happens!
done
