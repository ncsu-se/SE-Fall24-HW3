#!/bin/bash



awk -F, 'BEGIN {OFS = FS} 
NR == 1 {print; next} 
$3 == 2 {
    gsub(/female/, "F", $6)
    gsub(/male/, "M", $6)
}
{print}' titanic.csv > temp.csv && mv temp.csv titanic.csv

awk -F, 'NR > 1 && $3 == 2 && $NF ~ /S/ {
    gsub(/"/, "", $7)

    gsub(/^[ \t]+|[ \t]+$/, "", $7)

    if ($7 ~ /^[0-9]+(\.[0-9]+)?$/) {
        sum += $7; count++
    }
}
END {
    if (count > 0) 
        print "Average Age:", sum/count
    else 
        print "No valid ages found"
}' titanic.csv
