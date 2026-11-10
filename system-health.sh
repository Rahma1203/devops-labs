#!/bin/bash

threshold=${1:-80}

log(){
    echo "[$(date +%Y-%m-%d)] $*" >> health.log
}

echo "================================
       SYSTEM HEALTH CHECK
================================

Host: $(hostname)

Date: $(date +%Y-%m-%d)

Uptime: $(uptime -p)

Disk usage:

$(df -h /)
"
usage=$(df -h / | awk 'NR==2 {print $5}')
used=$(df -h / | awk 'NR==2 {print $5}'  | tr -d '%') 

if [ "$used" -gt "$threshold" ]; then
    log "STATUS: WARNING! The disk usage ($usage) is above the threshold ($threshold)"
    echo "STATUS: WARNING!"
    exit 1
else
    log "STATUS: OK The disk usage ($usage) is below the threshold ($threshold%)"
    echo "STATUS: OK"
    exit 0
fi

