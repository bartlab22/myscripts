#!/bin/bash
clear
for host in "$@"
do
        echo $host
        ssh $host 'sed -i 's/lordofknights/dragoonstory/g' /etc/hosts'
done

