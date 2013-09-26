#!/bin/bash
INPUT_PARAM="-ar 44100  -f alsa -i pulse  -f v4l2 -r 25 -i /dev/video0"
CODEC_PARAM=" "
OUTPUT_PARAM="-f flv -metadata streamName=myLiveStream tcp://navicular.iwr.uni-heidelberg.de:6666/live/myLiveStream"

ffmpeg $INPUT_PARAM $CODEC_PARAM $OUTPUT_PARAM 
