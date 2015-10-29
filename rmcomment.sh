#!/bin/bash

# rmcomment.sh : remove comment from stdin
# author : Kiyoon Kim, yoonkr33@gmail.com, sparkware.co.kr

if [ $# -lt 1 ] || [ $1 = "-h" ]  
then
    echo Usage: "cat infile | `basename $0` //" 1>&2
    echo 'remove comments(//) from stdin'
    exit 1
fi

piped=`cat`

echo "$piped" | sed -e "s|$1.*||"

exit 0
