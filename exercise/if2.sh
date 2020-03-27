#!/bin/bash

if pwd
then
    echo "It worked"
fi


count=1
if [ -n $count ]
then 
    echo "count has value"
else
    echo "count is null"
fi

if [ -n $count ]
then 
    echo "count has value"
elif [ -f $count ]
then
    echo "count is null"
fi
