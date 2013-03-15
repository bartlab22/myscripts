#!/bin/bash
clear
for host in "$@"
do
        ssh $host 'date'
done
