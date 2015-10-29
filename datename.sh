#!/bin/bash

# datename.sh
# author : Kiyoon Kim, yoonkr33@gmail.com, sparkware.co.kr

if [ $# -lt 1 ]; then
	echo "datename.sh : change file name as Birth Date or Modified Date"
	echo "author : Kiyoon Kim, yoonkr33@gmail.com, sparkware.co.kr"
	echo "usage : $0 [options] [files..]"
	echo "[options]:"
	echo "-m	use modified date (default : birth date)"
	echo ""
	echo "if you want to undo it, execute .datename_undo.sh"
	exit 1
fi

# define the undo file
undofile=".datename_undo.sh"

# depends on how many options, the index of [files..] may differ.
# use creation
strStat="Birth"
icOption=0
if [ ${1:0:1} == "-" ]; then
#	echo "option!"
	(( icOption++ ))
	if [ ${1:1} == "m" ]; then
		# use modified
		strStat="Modify"
	fi
fi

for file in "$@"
do
    list=`echo -e "$list\n$file"`
done

# remove all empty lines
list=$(echo "$list" | sed '/^$/d')

# remove option lines
if [ $icOption -ge 1 ]; then
	list=$(echo "$list" | sed "1,${icOption}d")
fi

# wrap every line with single quotes
#list=$(echo "$list" | sed 's/^/"/' | sed 's/$/"/')

#echo "$list"

echo "#!/bin/bash" > $undofile
echo "$list" | while read file
do
	# file name to be changed
	cmd="stat '$file' | fgrep $strStat | awk '{print \$2\"_\"\$3}' | sed -e 's/-//g' | sed -e 's/://g' | sed -e 's/\./_/'"
#	echo "$cmd"
	date=`eval $cmd`
	ms=`echo "$date" | awk -F _ '{print $3}'`

	# round
	ms=$(echo "$ms / 100000 + 5" | bc)
	ms=${ms%?}

	# leading zero
	ms=$(printf %03d $ms)

	date=$(echo "$date" | awk -F _ "{print \$1\"_\"\$2\"_$ms\"}") 
#	echo "$date"

	# get file extension
	extension=$(getext.sh "$file")

	# if the path contains '/' which means directory
	# outname will be generated with the directory path
	dir=$(getdir.sh "$file")
	outname="$dir$date${extension}"
	outname=$(tmpfile.sh "$outname")

	cmd="mv '$file' '$outname' -v --backup=t"
	eval $cmd

	undo="mv '$outname' '$file'"
	echo "$undo" >> $undofile

done


#list=$(find ${!iFileStart})

#printf "$list"
