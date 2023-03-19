#!/usr/bin/bash


fan=`sensors | grep fan1 | awk '{print $2}'`

printf "%s" "$fan" " RPM"
