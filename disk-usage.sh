#!/bin/bash

current_usage=$( df -h | grep 'root' | awk {'print $5'} )
#current_usage=95

#current_usage=$( df -h | grep '/home' | awk {'print $5'} )

max_usage=90%

if [ ${current_usage} > ${max_usage} ]; then
    
    echo " Max usage exceeded. Your disk usage is at ${current_usage} "
else
    echo "No problems. Disk usage at ${current_usage}." > /dev/null
fi
