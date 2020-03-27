#!/bin/bash

for test in a b c
do 
    echo "The next char is $test"
done


list="a b c"
list=$list" d"
for char in $list
do 
    echo "The next char is $char"
done


for file in ./*
do 
    if [ -d $file ]
    then 
        echo "$file is a directory"
    elif [ -f $file ]
    then 
        echo "$file is a file"
    fi
done

