#!/bin/sh

source "$BASE_DIR/config.sh"
source "$BASE_DIR/logger.sh"

FAIL_COUNT=0

while true; do
    for DOMAIN in "${DOMAINS[@]}"; do
        ping -c 1 $DOMAIN > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            FAIL_COUNT=$((FAIL_COUNT + 1))
            logger "Ping gagal ke $DOMAIN"
        else
            FAIL_COUNT=0
            logger "Ping berhasil ke $DOMAIN"
        fi

        if [ $FAIL_COUNT -ge $PING_FAILURE_THRESHOLD ]; then
            logger "Menonaktifkan data setelah $FAIL_COUNT kegagalan"
            sleep 10 # Tunggu sebelum mencoba lagi
            FAIL_COUNT=0
        fi
    done
    sleep $PING_INTERVAL
done
