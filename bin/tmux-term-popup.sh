#!/bin/bash
#
# tmux-term-popup.sh - Open a floating terminal in a tmux popup
#
# Usage: tmux-term-popup.sh
#
# Add to tmux.conf:
#   bind -Troot MouseDown1Status if -F '#{==:#{mouse_status_range},term}' { run-shell '/path/to/tmux-term-popup.sh' }
#

# Open tmux popup with a fresh shell
# -E closes popup when shell exits
# -w and -h set width/height as percentage
tmux popup -E -w 50% -h 50%
