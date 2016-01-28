#!/bin/bash

# mvdir.sh : Move directory to another for some specific files
#            If works only for the files containing some string,
#            and the string will be deleted after moving.
# Author : Kiyoon Kim (yoonkr33@gmail.com)
# Usage : mvdir.sh [input_dir] [output_dir] [containing_string]
# Warning : [containing_string] should be unique!!
# Example : mvdir.sh /home/music /home/music_converted __converted__
#           then move /home/music/folder/sample__converted__.mp3 -> /home/music/folder/sample.mp3

if [ $# -lt 3 ]
then
	echo "# mvdir.sh : Move directory to another for some specific files
#            If works only for the files containing some string,
#            and the string will be deleted after moving.
# Author : Kiyoon Kim (yoonkr33@gmail.com)
# Usage : mvdir.sh [input_dir] [output_dir] [containing_string]
# Warning : [containing_string] should be unique!!
# Example : mvdir.sh /home/music /home/music_converted __converted__
#           then move /home/music/folder/sample__converted__.mp3 -> /home/music/folder/sample.mp3"
	exit 1
fi

for files in $(find . -name "*$1/$3*")
do
	new_file=$(echo "$files" | sed -e "s/$1/$2/" | sed -e "s/$3//g")
	dir=$(bash getdir.sh $new_file)
	mkdir -p "$dir"
	mv -v "$files" "$new_file"
done
