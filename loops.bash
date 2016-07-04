#!/bin/bash

if [ -n "$1" ] & [ -n "$2" ]; then
	count=0
	while [ $1 -gt $count ]; do

		for (( i = 0; i < $2; i++ )); do
			time+=$(date)"\n"
			echo $time
		done

		for (( i = 0; i < 1; i++ )); do
			echo $time
		done

		count=$((count+1))

	done
else
	echo "Bitte Parameter eingeben: ./loops.bash [number1] [number2]"
fi
