#!/bin/bash

# getext.sh : get file extension
# author : Kiyoon Kim, yoonkr33@gmail.com, sparkware.co.kr

if [ $# -lt 1 ]
then
	echo "getext.sh : get file extension
author : Kiyoon Kim, yoonkr33@gmail.com, sparkware.co.kr
usage : $0 [file path]
example output : file.txt -> .txt"
	exit 1
fi

basename=$(basename "$1")
if [[ $basename == *"."* ]]
then
	ext=".${basename##*.}"
else
	ext=""
fi

echo "$ext"
