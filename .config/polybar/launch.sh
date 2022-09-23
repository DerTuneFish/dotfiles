#!/bin/env zsh

# terminate existing polybar
polybar-msg cmd quit

# launch
echo "---"   | tee -a /tmp/polybar.log
polybar 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
