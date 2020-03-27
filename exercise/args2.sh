#!/bin/bash

count=1
for param in "$*"
do
    echo "\$* parameter = $param"
    count=$[ $count + 1 ]
    echo "count=$count"
done


count=1
for param in $@
do 
    echo "\$@ parameter = $param"
    count=$[ $count + 1]
    echo "count=$count"
done


