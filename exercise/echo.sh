#!/bin/bash

total=$[ $1 * $2 ]
echo "The first parameter is $1"
echo "The second parameter is $2"
echo "The total number is $total"

echo "The file name is $0"
name=$(basename $0)
echo "The file name is $name"
