#!/bin/bash

for test in Alabama Alaska Arizona 
do
    echo The next state is $test
done

for test in I don\'t know if "T his'll" work
do 
    echo "word:$test"
done

list="Alabama Alaska Arizona Colorado"
list=$list" Connecticut"
for state in $list
do 
    echo "Have you ever visited $state?"
done 


file="states"
for state in $(cat $file)
do 
    echo "Visit beautiful $state"
done

#IFS
IFS=$'\n'

for file in ~/Documents/bash/bash-done/*
do
    if [ -d "$file" ]
    then
        echo "$file is a directory"
    elif [ -f "$file" ]
    then
        echo "$file is a file"
    fi
done


for (( i=1; i <= 10; i++ ))
do 
    echo "The next number is $i"
done 


