#!/bin/sh

LOG_FILE="/tmp/openwrt-auto-ping.log"

function logger() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}
