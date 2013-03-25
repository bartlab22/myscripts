#!/bin/bash
clear
for host in "$@"
do
	echo $host
        ssh $host 'cat /etc/resolv.conf'
done
