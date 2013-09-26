#!/bin/bash
INPUT_PARAM="-f v4l2 -r 25 -i /dev/video0"
#~ CODEC_PARAM="-threads 2 -vcodec libx264 "
CODEC_PARAM=" "
#~ OUTPUT_PARAM="-y out.avi"
#~ OUTPUT_PARAM="-f avi http://localhost:8080"
#~ OUTPUT_PARAM="-f flv rtmp://localhost:8080"
#~ OUTPUT_PARAM="-f flv rtp://navicular.iwr.uni-heidelberg.de:554"
#~ OUTPUT_PARAM="-f rtsp rtsp://navicular.iwr.uni-heidelberg.de:554/flvplayback/life"
OUTPUT_PARAM="-f flv -metadata streamName=myLiveStream tcp://navicular.iwr.uni-heidelberg.de:6666/live/myLiveStream"
#~ OUTPUT_PARAM="-f mpegts udp://navicular.iwr.uni-heidelberg.de:9999/flvplayback/life"
#~ OUTPUT_PARAM="-f flv pipe:1"


ffmpeg $INPUT_PARAM $CODEC_PARAM $OUTPUT_PARAM 
