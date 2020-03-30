#!/bin/bash

var="full"

if test $var
then 
    echo "The $var expression returns a true"
else 
    echo "The $var expression returns a false"
fi
 
testuser=rich

if [ "rich" = $testuser ]
then 
    echo "Welcom $testuser"
fi


if [ $testuser != "richi" ]
then 
    echo "This is not richi"
else 
    echo "Welcome $testuser"
fi