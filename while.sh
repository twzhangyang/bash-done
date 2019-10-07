#!/bin/bash
var1=10

while [ $var1 -gt 0 ]
do 
    echo $var1
    var1=$[ $var1 -1 ]
done 

var1=10
until [ $var1 -eq 0 ]
do
    echo $var1
    var1=$[ $var1 - 1 ]
done 


IFS.OLD=$IFS
IFS=$'\n'

for entry in $(cat /etc/passwd)
do
    echo "Values in $entry"
    IFS=:
    for value in $entry
    do 
        echo " $value"
    done 
done 

# break

for var1 in 1 2 3 4 5 6 
do 
    if [ $var1 -eq 5 ]
    then 
        break
    fi
    echo "Iteration number: $var1"
done
echo "The for loop is completed"


var1=1
while [ $var1 -lt 10 ]
do 
    if [ $var1 -eq 5 ]
    then 
        break
    fi 
    echo "Iteration: $var1"
    var1=$[ $var1 + 1 ]
done 
echo "The while loop is completed"

# continue
for (( var1 = 1; var1 < 15; var1++ ))
do 
    if [ $var1 -gt 5 ] && [ $var1 -lt 10 ]
    then 
        continue
    fi 
    echo "ITeration number: $var1"
done 

# output
# for file in /home/yrzhang/*
# do 
#     if [ -d "$file" ]
#     then 
#         echo "$file is a directory"
#     elif
#         echo "$file is a file"
#     fi
# done > output.txt


IFS=:
for folder in $PATH
do 
    echo "$folder:"
    for file in $folder/*
    do 
        if [ -x $file ]
        then 
            echo " $file"
        fi 
    done 
done 