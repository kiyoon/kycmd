
#!/bin/bash 

# macro.sh : multiple string with increasing number
# author : Kiyoon Kim, yoonkr33@gmail.com, sparkware.co.kr

# example : echo "abc%s" | macro.sh %s 1 5
# output  : abc1 abc2 abc3 abc4 abc5 (space is line feed)

if [ $# -lt 3 ] || [ $1 = "-h" ]  
then
    echo Usage: "cat infile | `basename $0` String NumStart NumEnd" 1>&2
    echo change String with NumStart to NumEnd with appending whole stdin
    exit 1
fi

piped=`cat`      # read from /dev/stdin

for i in `eval echo "{$2..$3}"`
do
  echo "$piped" | sed -e "s/$1/$i/g"
done

exit 0
