#!/bin/bash

find t -type f | while read line; do
	echo $line
	cat $line
	echo
done
