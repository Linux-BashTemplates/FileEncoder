#!/bin/bash

if [ -n "$1" ]
then
    FROM_ENCODING=$1
    TO_ENCODING="UTF-8"
    OUTPUT="output_"
    CONVERT=" iconv -f $FROM_ENCODING -t $TO_ENCODING"
	for file in *.txt; do
		$CONVERT -f $1 -o $1%.txt.utf8.converted
	  done
	exit 0
else
    echo "Incorrect agrument. Abort"
    echo "Usage: ./encode.sh <path/<filename>.txt>"
fi
