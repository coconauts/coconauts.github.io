#!/bin/bash

images="./posts"
files="../_posts"

if [[ "$@" == *"--help"* ]]; then 
  echo "Usage: ./used_images.sh [--help] [--debug]
        - help     Show this info
        - debug    Print the grep result to show where the file is used "
  exit 0
fi
if [[ "$@" == *"--debug"* ]]; then debug=true; fi

for file in `find "$images" -type f`; do
  f=`echo "$file" | cut -c 3-` #Cut first 2 characters "./"
  echo "Searching file: $f" 
  if [ $debug ]; then `grep -R "$f" "$files"`; fi
  
  contains=`grep -R "$f" "$files" | wc -l`
  if [ "$contains" == "0" ]; then
    echo "* Image $f is not used"
  fi 
done