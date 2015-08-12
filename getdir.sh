#!/bin/bash

# getdir.sh : get file directory path from string
# author : Kiyoon Kim, yoonkr33@gmail.com, http://sparkware.co.kr

if [ $# -lt 1 ]
then
	echo "getdir.sh : get file directory path from string
author : Kiyoon Kim, yoonkr33@gmail.com, http://sparkware.co.kr
usage : $0 [file path]
example output : ~/file.txt -> ~/"
	exit 1
fi

if [[ $1 == *"/"* ]]
then
	dir="${1%/*}/"
else
	dir=""
fi

echo $dir
