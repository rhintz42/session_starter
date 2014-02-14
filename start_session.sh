#!/bin/bash

if [ $# -eq 0 ]
    then
        echo "No arguments supplied"
        exit
fi

#TODO - Should only have written the avconv thing once. Should just go through the if statements with settings written down in variables as I go

HOST=$(hostname)                # Gets hostname of this computer
echo $HOST                      # Prints out what the hostname
SUBSTRING="7750"                # This substring is to check if it's my desktop
SUBSTRING2="meowmixwebsites"    # This substring is to check if it's my laptop
RESOLUTION_SIZE=`xdpyinfo | grep dimensions | cut -d ' ' -f 7`  # Gets the screen resolution of the machine

if echo "$HOST" | grep -q "$SUBSTRING"; then
    echo "${SUBSTRING} was found in ${HOST}"
    echo "${RESOLUTION_SIZE}"
    avconv -f x11grab -r 4 -s 3840x1080 -i :0.0 -vcodec libx264 -preset ultrafast -threads 4 -y $1.mp4  # The $1 is the first argument passed to this script
elif echo "$HOST" | grep -q "$SUBSTRING2"; then
    echo "${SUBSTRING} is not in ${HOST}, but ${SUBSTRING2} is in ${HOST}"
    echo "${RESOLUTION_SIZE}"
    #TODO - Add way of checking resolution and making modifications where necessary
    avconv -f x11grab -r 4 -s 1366x768 -i :0.0 -vcodec libx264 -preset ultrafast -threads 4 -y $1.mp4
else
    echo "No Proper Computer Choices Found. Please Add your Computer Settings to the File"
fi
