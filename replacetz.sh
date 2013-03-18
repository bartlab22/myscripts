#!/bin/bash
clear
for host in "$@"
do
	echo $host
        ssh $host 'rm /etc/localtime'
	ssh $host 'ln -s /usr/share/zoneinfo/Pacific/Pitcairn /etc/localtime'
	ssh $host 'date'
done
