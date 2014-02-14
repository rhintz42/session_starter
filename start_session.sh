#!/bin/bash

if [ $# -eq 0 ]
    then
        echo "No arguments supplied"
        exit
fi

HOST=$(hostname)
echo $HOST
SUBSTRING="7750"
SUBSTRING2="meowmixwebsites"

if echo "$HOST" | grep -q "$SUBSTRING"; then
    echo "${SUBSTRING} was found in ${HOST}"
    avconv -f x11grab -r 4 -s 3840x1080 -i :0.0 -vcodec libx264 -preset ultrafast -threads 4 -y $1.mp4
elif echo "$HOST" | grep -q "$SUBSTRING2"; then
    echo "${SUBSTRING} is not in ${HOST}, but ${SUBSTRING2} is in ${HOST}"
    avconv -f x11grab -r 4 -s 1366x768 -i :0.0 -vcodec libx264 -preset ultrafast -threads 4 -y $1.mp4
else
    echo "No Proper Computer Choices Found. Please Add your Computer Settings to the File"
fi
