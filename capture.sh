#!/bin/bash
set -e 
#================================
#Settings
DEV=/dev/video0
# to see the supported modes run
#  v4l2-ctl --list-formats-ext -d DEVICE

RES="640x480"
FPS=25
# Quality Settings, depending on your bandwith
#  video
V_BITRATE=600000

# Watermark
USE_WATERMARK=1

wget -q "http://eurobot.uni-hd.de/stream/server.php?show=true" -O /tmp/server
SERVER=$(cat /tmp/server)


#================================
#putting everything together
INPUT_PARAM="-ar 44100  -f alsa -i pulse  -f v4l2 -s $RES -r $FPS -i $DEV"
CODEC_PARAM="-f flv -vcodec flv -b:v $V_BITRATE -qmin 1 -qmax 31"

if [ "$USE_WATERMARK" = "1" ];
then
	WATERMARK_PARAM="-vf \"movie=watermark.png [watermark]; [in][watermark] overlay=main_w-overlay_w-10:main_h-overlay_h-10 [out]\""
	inkscape watermark.svg -e watermark.png
else
	WATERMARK_PARAM=""
fi

OUTPUT_PARAM="-metadata streamName=myLiveStream tcp://$SERVER:6666/live/myLiveStream"
FFMPEG="ffmpeg $INPUT_PARAM $WATERMARK_PARAM $CODEC_PARAM $OUTPUT_PARAM "

#================================
#runing commands
if [ ! -e $DEV ];
then
	echo "Video device $DEV not available"
	exit 
fi
#~ set -x
eval $FFMPEG
