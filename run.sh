#!/bin/bash

if
[ -z $1 ] ||
[ -z $2 ] ||
[ -z $3 ] ||
[ -z $4 ]; then
	echo "Missing arguments!"
	exit 0
fi

binary=$1
loop_cnt=$2
sleep_interval=$3
loop_count=$4

while [ $loop_count -gt 0 ]; do
	if [ $2 -gt $3 ]; then
		echo "Starting loop process"
		eval $binary $2 &
		pid=$!
		echo "PID of running process: $pid"
		sleep $3
		kill -9 $pid &> /dev/null
		echo "Finished process! :)"
	else
		echo "Kill timer greater than process duration!"
		exit 0
	fi
	(( loop_count-- ))
done

echo "Finished loop."
