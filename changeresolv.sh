#!/bin/bash
clear
for host in "$@"
do
        ssh $host 'echo -e "search dragoonstory.com\nnameserver 10.125.156.20\nnameserver 10.125.156.21" > /etc/resolv.conf'
done
