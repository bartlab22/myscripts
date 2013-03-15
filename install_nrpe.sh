#!/bin/bash
for host in "$@"
do
	rsync -av /opt/packages/nagios-nrpe $host:/opt/packages/
	ssh $host 'rpm -Uvh /opt/packages/nagios-nrpe/*'
	scp /etc/nagios/nrpe.cfg $host:/etc/nagios
	ssh $host 'service nrpe start'
	ssh $host 'chkconfig nrpe on'
done
