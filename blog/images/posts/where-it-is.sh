#!/bin/bash

for file in `ls`; do

  echo "Searching for file/folder in _posts: $file"
  count=$(grep "$file" ../../_posts/* | wc -l)

  echo "Found: $count"

  grep "$file" ../../_posts/*

  echo ""
done
