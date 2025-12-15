#!/usr/bin/env zsh
# 25-functions.zsh - Custom shell functions

# Tmux workspace function - replaces dev-tmux script
tmux-new() {
    if [[ $# -eq 0 ]] || [[ "$1" = "attach" ]]; then
        # Check if session N exists
        if ! command tmux has-session -t N 2>/dev/null; then
            command tmux new-session -s N -n DEVOPS -d
            command tmux split-window -v -t N:1
            command tmux new-window -t N:2 -n "RUST"
            command tmux new-window -t N:3 -n "RUST"
            command tmux new-window -t N:4 -n GO
            command tmux new-window -t N:5 -n Music
            command tmux select-window -t N:1
        fi
        command tmux -2 attach-session -t N
    else
        command tmux "$@"
    fi
}
