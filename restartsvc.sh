#!/bin/bash
clear
for host in "$@"
do
        #ssh $host 'service nrpe restart'
        #ssh $host 'service ntpd restart'
        #ssh $host 'service snmpd restart'
        #ssh $host 'service sshd restart'
        #ssh $host 'service rsyslog restart'
        ssh $host 'service crond restart'
done
