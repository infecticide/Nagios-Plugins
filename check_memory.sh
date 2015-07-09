#!/bin/bash

output=`free -m | grep "Mem:"`
total=`echo $output | awk '{print $2}'`
used=`echo $output | awk '{print $3}'`
free=`echo $output | awk '{print $4}'`
shared=`echo $output | awk '{print $5}'`
buffers=`echo $output | awk '{print $6}'`
cached=`echo $output | awk '{print $7}'`

mb="MB"

echo "Free: $free$mb, Used: $used$mb, Shared: $shared$mb, Buffers: $buffers$mb, Cached: $cached$mb|total=$total$mb;;;0;$total,used=$used$mb;;;0;$total,free=$free$mb;;;0;$total,shared=$shared$mb;;;0;$total,buffers=$buffers$mb;;;0;$total,cached=$cached$mb;;;0;$total"
exit 0
