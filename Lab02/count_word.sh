#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Usage: $0 <file> <word>"
  exit 1
fi

file="$1"
word="$2"

if [ ! -f "$file" ]; then
  echo "Error: File not found: $file"
  exit 1
fi

count=$(grep -o "$word" "$file" | wc -l)
echo "The word '$word' appears $count times in $file."
