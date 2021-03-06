#!/bin/bash

if [[ "$(uname)"=="Darwin" ]]; then
    echo "Mac"
elif [[ "$(expr substr $(uname -s) 1 5)"=="Linux" ]]; then
    echo "Linux"
elif [[ "$(expr substr $(uname -s) 1 10)"=="MINGW32_NT" ]]; then
    echo "Windows"
else
    echo "Others"
fi

echo basename $(pwd)
CurrentFilename=${PWD##*/}
echo $CurrentFilename
