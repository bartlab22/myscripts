#################################################
# checkcache.sh                                 #
# checks cache server settings                  #
# AGS - Bart AGreda                             #
# ver. 1.0 02/28/2013                           #
#################################################
#!/bin/bash
clear
for host in "$@"
do
        echo $host

        #echo -e '\n PHP Version'
        #ssh $host 'php -v'

        #echo -e '\n /etc/resolv.conf'
        #ssh $host 'cat /etc/resolv.conf'

        #echo -e '\n Appuser check'
        #ssh $host 'cat /etc/passwd | grep appuser'

        echo -e '\n Memcached check'
        ssh $host 'netstat -antp | grep memcached'
        ssh $host 'netstat -anup | grep memcached'
        ssh $host 'service memcached status'

        #echo -e '\n /etc/hosts'
        #ssh $host 'cat /etc/hosts'

	#echo -e '\n Rsyslog check'
        #ssh $host 'logger -p local1.info $HOSTNAME'
        #ssh infra 'tail /var/log/www/error.log'
done

