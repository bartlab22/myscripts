#################################################
# checkwww.sh					#
# checks www server settings			#
# AGS - Bart AGreda				#
# ver. 1.0 02/28/2013				#
#################################################
#!/bin/bash
clear
for host in "$@"
do
        echo $host
        
	echo -e '\n PHP Version'
        ssh $host 'php -v'

	echo -e '\n /etc/php.ini'
        ssh $host 'cat /etc/php.ini | egrep "error_reporting ="'
        ssh $host 'cat /etc/php.ini | egrep "display_errors ="'
        ssh $host 'cat /etc/php.ini | egrep "display_startup_errors ="'
        ssh $host 'cat /etc/php.ini | egrep "expose_php ="'
        ssh $host 'cat /etc/php.ini | egrep "date.timezone ="'

        echo -e '\n /etc/httpd/conf/httpd.conf'
        ssh $host 'cat /etc/httpd/conf/httpd.conf | egrep ServerName'
        ssh $host 'cat /etc/httpd/conf/httpd.conf | egrep "/24"'

        echo -e '\n /etc/httpd/conf.d/proxy_ajp.conf'
        ssh $host 'cat /etc/httpd/conf.d/proxy_ajp.conf | egrep "LoadModule proxy_ajp_module modules/mod_proxy_ajp.so"'

        echo -e '\n /etc/php.d/apc.ini'
        ssh $host 'cat /etc/php.d/apc.ini'

		echo -e '\n HTTPD Service check'
		ssh $host 'netstat -antp | grep httpd'
		ssh $host 'netstat -anup | grep httpd'
		ssh $host 'service httpd status'

        echo -e '\n Appuser check'
        ssh $host 'cat /etc/passwd | grep appuser'

        echo -e '\n /etc/resolv.conf'
        ssh $host 'cat /etc/resolv.conf'

        echo -e '\n Rsyslog check'
        ssh $host 'logger -p local1.info $HOSTNAME'
        ssh infra 'tail /var/log/www/error.log'
done
