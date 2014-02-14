#!/bin/bash

if [ $# -eq 0 ]
    then
        echo "No arguments supplied"
        exit
fi

HOST=$(hostname)
echo $HOST
SUBSTRING="7750"

if [ "${HOST/$SUBSTRING}" = "$HOST" ] ; then
    echo "${SUBSTRING} is not in ${HOST}"
    avconv -f x11grab -r 4 -s 3840x1080 -i :0.0 -vcodec libx264 -preset ultrafast -threads 4 -y $1.mp4
else
    echo "${SUBSTRING} was found in ${HOST}"
fi
