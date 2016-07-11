#!/bin/bash

function1()
{
    caller 0   # Tell me about it.
               # You may find this command useful in debugging.
}

function1

caller 0       # Has no effect because it's not inside a function.

exit
