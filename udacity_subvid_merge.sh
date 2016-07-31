#!/bin/bash

# Author : Kiyoon Kim (yoonkr33@gmail.com)
# Usage : Execute this script where you downloaded the udacity course video, subtitles and unzipped it to each directories.
# Example : "Introduction to recognition Videos" and "Introduction to recognition Subtitles" folder -> merge to "Introduction to recognition" folder

com=`find . -name *.srt | sed -e 's/^/"/' | sed -e 's/$/"/' | while read line; do printf "$line "; echo "$line" | sed 's/Subtitles/Videos/'; done | sed -e 's/^/mv /'`
eval "$com"

rmdir *Subtitles

com=`find . -type d -name '*Videos' | sed -e 's/^/"/' | sed -e 's/$/"/' | while read line; do printf "$line "; echo "$line" | sed 's/ Videos//'; done | sed -e 's/^/mv /'`
eval "$com"
