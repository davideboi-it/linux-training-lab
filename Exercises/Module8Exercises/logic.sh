#!/bin/bash
# Simple logic and display

if [ $# != 1  ] # to check if there's at least one input
then 
	echo Usage - This script requires at least 1 input
	exit
fi

if [ $1 = "1" ]
then
	echo "The argument entered was 1"
	exit 0
fi

if [ $1 = "2" ]
then
	echo "The argument entered was 2"
	exit 0
else
	echo "The argument entered wasn't 2"
	exit 1
fi
