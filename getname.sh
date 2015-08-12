#!/bin/bash

# getname.sh : get file name without extension from string
# author : Kiyoon Kim, yoonkr33@gmail.com, http://sparkware.co.kr

if [ $# -lt 1 ]
then
	echo "getname.sh : get file name without extension from string
author : Kiyoon Kim, yoonkr33@gmail.com, http://sparkware.co.kr
usage : $0 [file path]
example output : ~/file.txt -> file"
	exit 1
fi

name=$(basename "$1")
name=${name%.*}

echo $name
