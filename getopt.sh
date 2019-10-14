#!/bin/bash

#./getopt.sh -a -b test1 -c 1 2 3

# Extract command line options & values with getopt

echo $@

# getopt ab:cd -a -b test1 -cd test2 test3
set -- $(getopt ab:c "$@")

echo 
while [ -n "$1" ]
do 
    case "$1" in 
    -a) echo "Found the -a option" ;;
    -b) param="$2"
        echo "Found the -b option, with parameter value $param"
        shift ;;
    -c) echo "Found the -c option" ;;
    --) shift
        break ;;
    *) echo "$1 is not an option" ;;
    esac
    shift
done 

count=1
for param in "$@"
do 
    echo "Parameter #$count: $param"
    count=$[ $count + 1]
done 




