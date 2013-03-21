#!/bin/bash
for host in $@
do
	ssh $host 'mysql -uroot -pm3mqcsMB1n -e"show slave status\G"'
done
