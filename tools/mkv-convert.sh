#!/bin/bash

# 视频批量转换工具
# This script can downscale video from mp4 to mkv making the size smaller.
# @author andy

COUNT=1

for V in `ls -1 *.mp4`
do
    if [ "$COUNT" -lt 10 ]
    then
	NAME=0$COUNT
    else
	NAME=$COUNT
    fi

    ffmpeg -i "$V" -filter:v scale=720:-1 -c:a copy $NAME.mkv && (( COUNT++ ))
done

exit 0
