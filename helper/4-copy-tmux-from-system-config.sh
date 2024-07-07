#!/usr/bin/env bash

# Absolute path to the folder containing the script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# echo $SCRIPT_DIR

# Go to script directory
cd $SCRIPT_DIR

cd ..

# Copy tmux folder to config folder on system
cp -r ~/.config/tmux .
