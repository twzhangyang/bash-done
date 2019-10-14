#!/bin/bash

date > test1

who >> test1

wc < test1

# STDIN 0
# STDOUT 1
# STDERR 2


ls -al test badtest test2 2> test2
ls -al test test2 test3 badtest 2> test6 1> test7
ls -al test test2 test3 badtest &> test7

#临时重定向 

echo "This is an error message" >&2

#永久重定向
exec 1>testout

exec 2>testerror

exec 0< testfile





