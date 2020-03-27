#!/bin/bash

function func1 {
    echo "This is an example of a function"
}

func1

function func2() {
    ls -l badfile
}

func2
echo "The exist status is: $?"

function func3 {
    read -p "Enter a value: " value
    echo "doubling the value"
    return $[ $value * 2 ]
}

result=$(func3)
echo "The new value is $?"

function func4 {
    echo $[ $1 * $2 ]
}

func4 1 2