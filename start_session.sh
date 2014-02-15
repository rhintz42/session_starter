#!/bin/bash
if [ $# -eq 0 ]
    then
        echo "No arguments supplied"
else
    DIRECTORY=`date +"20%y_%m_%d"`
    SUBDIRECTORY="$1"
    if [ ! -d "$DIRECTORY" ]; then
        mkdir $DIRECTORY
    fi

    if [ ! -d "$DIRECTORY/$SUBDIRECTORY" ]; then
        mkdir $DIRECTORY/$SUBDIRECTORY
    fi

    source record_terminal.sh "$DIRECTORY/$SUBDIRECTORY"
    ./record_desktop.sh "$DIRECTORY/$SUBDIRECTORY/vid"
    #ffmpeg -i $1.mp4 -acodec mp2 output.mp4
    #rm $1.mp4
    #mv output.mp4 $1.mp4
fi

