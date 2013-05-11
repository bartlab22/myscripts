#!/bin/bash
clear
for host in "$@"
do
        echo $host
	ssh $host 'crontab -l'
done
