#!/bin/bash
clear
for host in "$@"
do
        echo $host
	scp /root/rsyslog.conf $host:/etc/rsyslog.conf
	ssh $host 'service rsyslog restart'
done
