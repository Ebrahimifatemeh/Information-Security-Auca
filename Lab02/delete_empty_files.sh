#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

dir="$1"

if [ ! -d "$dir" ]; then
  echo "Error: Directory not found: $dir"
  exit 1
fi

found=0
while IFS= read -r -d '' f; do
  echo "Deleted: $f"
  rm -f "$f"
  found=1
done < <(find "$dir" -type f -empty -print0)

if [ $found -eq 0 ]; then
  echo "No empty files found in $dir."
fi
