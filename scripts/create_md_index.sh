#!/bin/bash

# Get the name of the subdirectory as an argument
SUBDIR=$1

# Check if a subdirectory name is provided as an argument
if [[ -z "$SUBDIR" ]]; then
  echo "Please provide the name of a subdirectory"
  exit 1
fi

# Check if the subdirectory exists
if [[ ! -d "$SUBDIR" ]]; then
  echo "Subdirectory $SUBDIR does not exist"
  exit 1
fi

# Create the index file
echo "# Index of $SUBDIR" > "$SUBDIR/index.md"
echo "" >> "$SUBDIR/index.md"

# Find all Markdown files in the subdirectory and append them to the index file
find "$SUBDIR" -type f -name "*.md" | sort | while read FILENAME; do
  LINKNAME=$(grep -m 1 '^# ' "$FILENAME" | sed 's/^# //')
  echo "* [$LINKNAME]($FILENAME)" >> "$SUBDIR/index.md"
done

echo "Index file created: $SUBDIR/index.md"
