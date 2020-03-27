#!/bin/bash

while [ -n "$1" ]
do 
    case "$1" in 
        -a) echo "Found the -a option";;
        -b) param=$2
            echo "Found the -b option, with parameter value $param"
            shift ;;
        -c) param=$2
            echo "Found the -c option, with parameter value $param"
            shift ;;
        --) shift
            break ;;
        *)  echo "$1 is not an option";;
    esac
    shift
done

for p in $@
do
    echo "param is $p"
done
