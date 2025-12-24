#!/bin/bash
filedir=$1
searchstr=$2

if [ -z "$filedir" ] || [ -z "$searchstr" ];
    then
        echo "Error: Two arguments required"
	echo "Usage: $0 <filedir> <searchstr>"
	exit 1
fi

if [ ! -d "$filedir" ]
    then 
        echo "Error: Directory '$filedir' does not exist on filesystem."
	exit 1
fi


echo "Searching for '$searchstr' in directory 'filedir'...."

files_count=$(find "$filedir" -type f | wc -l | tr -d '[:space:]')
matches_count=$(grep -r "$seachstr" "$filedir" | wc -l | tr -d '[:space:]')
grep -rn "$searchstr" "$filedir" 


echo "The number of files are ${files_count} and the number of matching lines are ${matches_count}"

exit 0
