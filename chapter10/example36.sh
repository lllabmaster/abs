#!/bin/bash

PS3='Choose your favorite vegetable: '

echo

choice_of()
{
    select vegetable  # 'select' uses arguments passed to function.
    do
	echo
	echo "Your favorite veggie is $vegetable."
	echo "Yuck!"
	echo
	break
    done
}

choice_of beans rice carrots radishes tomatoes spinach

exit 0
