#!/bin/bash

if [ $# -ne 2 ]
    then
        echo "Error: Two Arguments required"
	echo "Usage: $0 <writefile> <writestr>"
	exit 1
fi

writefile=$1
writestr=$2

writedir=$(dirname "$writefile")

if ! mkdir -p "$writedir";
    then 
        echo "Error: could not create directory path $writedir"
        exit 1
fi

if ! echo "$writestr" > "$writefile";
    then
        echo "Error: Could not create or write to file $writefile"
        exit 1
fi

exit 0
