#!/bin/bash
# escaped characters

echo; echo

# Escaping a newline.
# ------------------

echo ""

echo "This will print
as two lines."

echo "This will print \
as one line."

echo; echo

echo "=========="

echo "\v\v\v\v"      # Prints \v\v\v\v literally.

# Use the -e option with 'echo' to print escaped characters.
echo "=========="
echo "VERTICAL TABS"
echo -e "\v\v\v\v"   # Prints 4 vertical tabs. 
echo "=========="

echo "QUOTATION MARK"
echo -e "\042"       # Prints " (quote, octal ASCII character 42).
echo "=========="

# The $'\X' construct makes the -e option unnecessary.
echo; echo "NEWLINE AND BEEP"
echo $'\n'           # Newline.
echo $'\a'           # Alert (beep).

echo "=========="
echo "QUOTATION MARKS"
echo $'\t \042 \t'   # Quote (") framed by tabs.
echo $'\t \x22 \t'   # Quote (") framed by tabs.
echo "=========="
echo

# Assigning ASCII characters to a variable.
quote=$'\042'
echo "$quote This is a quoted string, $quote and this lies outside the quotes."
echo

# Concatenating ASCII chars in a variable.
triple_underline=$'\137\137\137'  # 137 is octal ASCII code for '_'.
echo "$triple_underline UNDERLINE $triple_underline"

echo

ABC=$'\101\102\103\010'           # 101, 102, 103 are octal A, B, C.
echo $ABC

echo; echo

escape=$'\033'                      # 033 is octal for escape.
echo "\"escape\" echoes as $escape" # No visible output.

echo; echo

exit 0
