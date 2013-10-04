#!/bin/bash
# Requirements: sed, tr
# Usage: crunch-sbv captions.sbv extension

# If file extension is not provided use markdown i.e. .md
if [ -z "$2" ]
  then
    ext="md"
  else
    ext="$2"
fi

# Prepare output file with default / provided extension
out=$(echo "$1" | sed "s/sbv/$ext/")

# Do the sed and tr magic with input and write it to output file
sed -e "/,/d" -e "/^$/d" "$1" | tr '\n' ' ' | sed -e '$a\' > "$out"

exit
