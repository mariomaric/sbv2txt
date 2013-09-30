#!/bin/bash
# Requirements: sed, grep, tr
# Usage: crunch-sbv input.sbv extension

# Output file - change file extension
# If file extension is not provided use markdown i.e. .md
if [ -z "$2" ]
  then
    ext="md"
  else
    ext="$2"
fi
out=$(echo "$1" | sed 's/sbv/"$ext"/')

# Do the grep and tr magic :)
grep -v -e "," "$1" | grep -v -e "^$" | tr '\n' ' ' > "$out"

exit
