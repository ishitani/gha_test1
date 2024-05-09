#!/bin/bash

FILE=$1
FILETYPE=$(perl -e 'binmode(STDIN); while (<STDIN>) { if (/\r/) { print "1"; exit } } print "0"' < $FILE)
if [ $FILETYPE == "1" ]; then
    echo "XXXXXXXX: $FILE $FILETYPE"
    exit 1
else
    echo "$FILE $FILETYPE"
fi
