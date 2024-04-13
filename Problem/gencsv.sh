#!/bin/bash

# Defing thr index arrgements

if [ "$#" -ne 2 ]; then
    echo "Usage: ./gencsv.sh <start_index> <end_index>"
    exit 1
fi

# Difing the index values
start_index=$1
end_index=$2

# Check if start index is not grater than end index
if [ "$start_index" -ge "$end_index" ]; then
    echo "Error: Start index must be less than end index"
    exit 1
fi

# Generate CSV file with random numbers
filename="inputFile.csv"
echo "Index,Number" > "$filename"
for ((i = start_index; i <= end_index; i++)); do
    echo "$i, $((RANDOM % 1000))" >> "$filename"
done

echo "CSV file generated: $filename"
