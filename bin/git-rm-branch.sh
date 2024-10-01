#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <branch-prefix>"
  exit 1
fi

# The prefix to match
PREFIX=$1

# List all branches, filter those that start with the given prefix, and delete them
git branch | grep "^ *$PREFIX" | sed 's/^ *//g' | xargs -I {} git branch -d {}

