#!/bin/bash
# Requirements: sed, grep, tr
# Usage: sbv2txt input.sbv

# Output file - change file extension from .sbv to .txt
out=$(echo "$1" | sed 's/sbv/txt/')

# Do the grep and tr magic :)
grep -v -e "," "$1" | grep -v -e "^$" | tr '\n' ' ' > "$out"

exit
