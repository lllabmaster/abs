#!/bin/bash

# Demonstrating some of the uses of 'expr'


# Arithmetic Operators
echo "Arithmetic Operators"
echo

a=`expr 5 + 3`
echo "5 + 3 = $a"

a=`expr $a + 1`
echo "a + 1 = $a"

a=`expr 5 % 3`
echo "5 mod 3 = $a"

echo

#  Logical Operators
#  Returns 1 if true, 0 if false,
#+ opposite of normal Bash convention.
echo "Logical Operators"
echo

x=24
y=25
b=`expr $x = $y`  # Test equality.
echo "b = $b"     # 0

a=3
b=`expr $a \> 10`
echo "b = $b"     # 0

b=`expr $a \< 10`
echo "b = $b"     # 1

b=`expr $a \<= 3`
echo "b = $b"     # 1

echo

# String Operators
echo "String Operators"
echo

a=1234zipper43231
echo "The string being operated upon is \"$a\"."

# length: length of string.
b=`expr length $a`
echo "Length of \"$a\" is $b."

# index: position of first character in substring
#        that matches a character in string.
b=`expr index $a 23`
echo "Numerical position of first \"2\" in \"$a\" is \"$b\"."

# substr: extract substring, starting position & length specified.
b=`expr substr $a 2 6`
echo "Substring of \"$a\", starting at position 2 and 6 chars long is \"$b\"."

b=`expr match "$a" '[0-9]*'`      # Numerical count.
echo "Number of digits at the beginning of \"$a\" is $b."

b=`expr match "$a" '\([0-9]*\)'`  # Note that escaped parentheses trigger substring match.
echo "The digits at the beginning of \"$a\" are \"$b\"."

exit 0
