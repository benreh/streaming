#!/bin/bash
set -e 

PRE="stream"


wget -q "http://eurobot.uni-hd.de/stream/server.php?show=true" -O /tmp/server
SERVER=$(cat /tmp/server)

# find output filename
i="0"

OUTPUT_FILENAME="$PRE-$i.flv"
while ([ -e $OUTPUT_FILENAME ]);
do
	i="$(($i+1))"
	OUTPUT_FILENAME="$PRE-$i.flv"
done

echo "writing to $OUTPUT_FILENAME"
#================================
#runing commands

set -x
rtmpdump -r "rtmp://$SERVER/live/myLiveStream" --live -o $OUTPUT_FILENAME
