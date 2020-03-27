#!/bin/bash

if [ $# -ne 2 ]
then 
    echo usage: test a b
    echo 
else 
    total=$[ $1 + $2 ]
    echo "total is $total"
    echo "parameter length is $#"
fi