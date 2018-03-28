#!/bin/bash

if [ -n "$1" ] && [ -n "$2" ] && [ "$2" -eq "$2" ] && [ "$#" -eq 2 ] 2>/dev/null; then
if ! [ -d $1 ]; then echo 'No directory' >&2; exit 1; fi
nameBackUp=`echo $1 | sed 's/^\///' | sed 's/\//-/g' | sed 's/-$//'`
countBackUp=$2
else echo "You entered incorrect parameters" >&2; exit 1
fi

if ! [ -d "/tmp/backups/" ]; then mkdir /tmp/backups; fi

for (( i = $(($2-1)); i >= 0; i-- ))
do
if [ $i -eq 0 ]; then tar -zcf /tmp/backups/$nameBackUp.tar.gz $1 2> /dev/null; break 
fi
tar -zcf /tmp/backups/$nameBackUp$i.tar.gz $1 2> /dev/null;
done

rm -f /tmp/backups/$nameBackUp[!0-$(($2-1))].tar.gz 
