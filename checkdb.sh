#################################################
# checkdb.sh                                    #
# checks db server settings                     #
# AGS - Bart AGreda                             #
# ver. 1.0 02/28/2013                           #
#################################################
#!/bin/bash
clear
for host in "$@"
do
        echo $host

        echo -e '\n /etc/resolv.conf'
        ssh $host 'cat /etc/resolv.conf'

        echo -e '\n DB Settings check'
        ssh $host 'cat /etc/my.cnf | grep server-id'
        ssh $host 'ls -al /var/log | grep mysql'
        ssh $host 'ls -al /var | grep dbdump'
        ssh infra 'crontab -l'

        
	echo -e '\n DB Service check'
	ssh $host 'netstat -antp | grep mysqld'
	ssh $host 'netstat -anup | grep mysqld'
	ssh $host 'service mysqld status'

	echo -e '\n Rsyslog check'
        ssh $host 'logger -p local1.info $HOSTNAME'
        ssh infra 'tail /var/log/www/error.log'
done

