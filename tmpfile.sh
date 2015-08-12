#!/bin/bash

# tmpfile.sh : change file name if exists.
# author : Kiyoon Kim, yoonkr33@gmail.com, sparkware.co.kr

# example : file.txt -> file~1.txt

if [ $# -lt 1 ]
then
	echo "tmpfile.sh : change file name if exists
author : Kiyoon Kim, yoonkr33@gmail.com, sparkware.co.kr
usage : $0 [filename]
example input, output : file.txt -> file~1.txt"
	exit 1
fi

# originame name
origname=$1
# without extension
woext="${origname%.*}"
# extension including dot
ext=$(getext.sh $origname)
# will output this
outname=$origname
# numbering
count=1
while [ -e $outname ]
do
	outname="${woext}~${count}${ext}"
	((count++))
done

echo $outname
