#!/bin/bash

if [ -n "$1" ] 2> /dev/null && [ -n "$2" ] 2>/dev/null && [ "$2" -eq "$2" ] 2>/dev/null && [ "$#" -eq 2 ] 2>/dev/null; then
if ! [ -e "$1" ] 2>/dev/null; then echo 'ERROR: No directory' >&2; exit 1; fi
nameBackUp=`echo $1 | sed 's/^\///' | sed 's/\//-/g' | sed 's/-$//'`
countBackUp=$2
else echo "ERROR: You entered incorrect parameters" >&2; exit 1
fi

if ! [ -d "/tmp/backups/" ]; then mkdir /tmp/backups; fi

for (( i = $(($2-1)); i >= 0; i-- ))
do
if [ "$i" -eq 0 ]; then 
tar -zcf /tmp/backups/"$nameBackUp".tar.gz "$1" 2> /dev/null; break 
fi
tar -zcf /tmp/backups/"$nameBackUp""$i".tar.gz "$1" 2> /dev/null;
done

for (( i = `ls /tmp/backups | grep "root-task4_3" | wc -l`; i >= $(($2)); i-- ))
do
rm -f /tmp/backups/$nameBackUp$i.tar.gz
done

#rm -f /tmp/backups/$nameBackUp{$(($2))..$(($count))}.tar.gz 
