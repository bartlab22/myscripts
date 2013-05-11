#!/bin/bash
clear
for host in "$@"
do
        echo $host
	scp /root/new_cron.txt $host:/root/new_cron.txt
	ssh $host 'crontab /root/new_cron.txt'
done
