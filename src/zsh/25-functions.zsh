#!/usr/bin/env zsh
# 25-functions.zsh - Custom shell functions

# Tmux workspace function - replaces dev-tmux script
tmux-new() {
    if [[ $# -eq 0 ]] || [[ "$1" = "attach" ]]; then
        # Check if session M1 exists
        if ! command tmux has-session -t M1 2>/dev/null; then
            command tmux new-session -s M1 -n DEVOPS -d
            command tmux split-window -v -t M1:1
            command tmux new-window -t M1:2 -n "RUST"
            command tmux new-window -t M1:3 -n "RUST"
            command tmux new-window -t M1:4 -n GO
            command tmux new-window -t M1:5 -n Music
            command tmux select-window -t M1:1
        fi
        command tmux -2 attach-session -t M1
    else
        command tmux "$@"
    fi
}
