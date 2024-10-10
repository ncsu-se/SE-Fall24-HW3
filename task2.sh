#!/bin/bash

cd dataset1 || { echo "dataset1 directory not found."; exit 1; }

grep -l "sample" * | \
xargs -I {} sh -c 'echo "{} $(grep -o "CSC510" {} | wc -l)"' | \
awk '$2 >= 3 {print $1, $2}' | \
while read -r file occurrences; do
    size=$(stat -f%z "$file")
    echo "$occurrences $size $file"
done | \
sort -k1,1nr -k2,2nr | \
awk '{print $3}' | \
sed 's/^file_/filtered_/'