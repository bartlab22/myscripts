#################################################
# checktw.sh					#
# checks www server settings			#
# AGS - Bart AGreda				#
# ver. 1.0 05/08/2013				#
#################################################
#!/bin/bash
clear
for host in "$@"
do
        echo $host
        ssh $host 'netstat\ -an|awk '\/tcp\/ \{print $6\}'|sort|uniq -c'
done
