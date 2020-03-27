#!/bin/bash

echo "Start running tests"

for folder in $(ls -d -1 */)
do 
    echo "Start running test $folder"
    dotnet test $folder
done

for folder in $(find . -maxdepth 1 -type d)
do
    echo "start running test $folder"
done 

echo "Start to filter dal tests project"
for folder in $(ls -d */ | grep -v "common")
do 
    echo "Run test on $folder"
done

echo "Start unit test by xargs"
ls -d */ | xargs -L 1 dotnet test
