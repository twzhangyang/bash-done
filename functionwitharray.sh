#!/bin/bash

function testit {
    local newarray
    newarray=("$@")
    echo "The new array value is : ${newarray[*]}"
}

myarray=(1 2 3 4)
echo "The original array is ${myarray[*]}"
testit ${myarray[*]}
