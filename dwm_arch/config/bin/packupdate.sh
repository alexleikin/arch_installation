#!/usr/bin/ksh


cnt=`/usr/bin/checkupdates | wc -l`

if [[ $cnt -gt 0 ]];then
	print $cnt > ~/.local/countpackages
else
	print "0" > ~/.local/countpackages
fi
