#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "linux-gnu"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Mac"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "cygwin"
elif [[ "$OSTYPE" == "msys" ]]; then
    echo "msys"
elif [[ "$OSTYPE" == "win32" ]]; then
    echo "win32"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "freebsd"
else
    echo "other"
fi
