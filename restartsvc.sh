#!/bin/bash
clear
for host in "$@"
do
        echo $host
	#ssh $host 'service nrpe restart'
        #ssh $host 'service ntpd restart'
        #ssh $host 'service snmpd restart'
        #ssh $host 'service sshd restart'
        #ssh $host 'service rsyslog restart'
        #ssh $host 'service httpd restart'
        ssh $host 'service crond restart'
done
