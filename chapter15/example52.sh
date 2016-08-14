#!/bin/bash

# Capture keystrokes without needing to press ENTER.

keypresses=4                # Number of keypresses to capture.
old_tty_setting=$(stty -g)  # Save old terminal settings.

echo "Press $keypresses keys."
stty -icanon -echo          # Disable canonical mode.
                            # Disable local echo.

# 'dd' uses stdin, if "if" (input file) not specified.
keys=$(dd bs=1 count="$keypresses" 2> /dev/null)

stty "$old_tty_setting"     # Restore old terminal settings.

echo "You pressed the \"$keys\" keys."

exit 0
