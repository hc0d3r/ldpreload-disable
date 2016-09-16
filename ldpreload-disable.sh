#!/bin/bash

if [ $# -lt 1 ];then
	printf "./ldpreload-disable.sh [ld-linux.so] [64|32]\n"
	exit 0
fi

ld_linux="$1"
[ "$2" == "64" ] && xor='\x48' || xor=''

offset=$((16#$(readelf -s $ld_linux | awk '/do_preload/ {print $2}')))
printf $xor'\x31\xc0\xc3' | dd conv=notrunc of=$ld_linux bs=1 seek=$offset

