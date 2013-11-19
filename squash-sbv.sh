#!/bin/bash
# Info: https://github.com/mariomaric/squash-sbv#readme

# If file extension is not provided use markdown
if [ -z "$2" ]
then
    ext="markdown"
else
    ext="$2"
fi

# Prepare output file with default / provided extension
out=$(echo "$1" | sed -e "s/sbv/$ext/")

# Do the grep,grep,  sed and tr magic with input and write it to output file
# 1) Delete lines containing time stamps
# 2) Delete empty lines
# 2) Replace newlines with space
# 3) Add one newline to the end of file
grep -v -e ".*\..*,.*\..*" "$1" | sed '/^$/d' | tr '\n' ' ' | sed -e '$a\' > "$out"

exit 0
