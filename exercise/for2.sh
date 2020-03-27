#!/bin/bash

factorial=1
for (( number = 1; number <= $1; number++))
do
    factorial=$[ $factorial * $number ]
done
echo "The factorial of $1 is $factorial"


factorial=1
for (( number = 1; number <= $1; number++ ))
do 
    factorial=$[ $factorial * $number ]
done
echo "Hello of $1 is $factorial"

factorial=2
for ((number=1; number<=$1; number++))
do
    factorial=$[$factorial + $number]
done
echo "Hello:$1 is $factorial"