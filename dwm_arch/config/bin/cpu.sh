#!/usr/bin/bash


cpu=`sensors | grep Tctl | awk '{print $2}'`

printf "%s" "$cpu"
