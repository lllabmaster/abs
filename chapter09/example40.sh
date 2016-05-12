#!/bin/bash

# Indirect variable referencing.

a=letter_of_alphabet
letter_of_alphabet=z

# Direct reference.
echo "a = $a"

# Indirect reference.
eval a=\$$a
echo "a = $a" # a = z

echo

# Now, let's try changing the second-order reference. 
t=table_cell_3
table_cell_3=24
echo "\"table_cell_3\" = $table_cell_3"
echo -n "dereferenced \"t\" = "; eval echo \$$t

echo

t=table_cell_3
NEW_VAL=387
table_cell_3=$NEW_VAL
echo "Changing value of \"table_cell_3\" to $NEW_VAL."
echo "\"table_cell_3\" now $table_cell_3"
echo -n "dereferenced \"t\" now "; eval echo \$$t
# "eval" takes the two arguments "echo" and "\$$t" (set equal to $table_cell_3)

echo

exit 0
