#!/bin/bash

if [ $# -lt 1 ]
then
	echo "usage : $0 [option]
option : -f file
         -d directory"

	exit 1
fi

dateformat=$(date +"%y%m%d_%H%M%S")

if [ $1 == "-f" ]
then
	touch $dateformat
else
	mkdir $dateformat
fi

echo $dateformat
