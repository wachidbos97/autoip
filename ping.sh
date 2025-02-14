#!/bin/sh

source "$BASE_DIR/config.sh"
source "$BASE_DIR/helpers/adb_helper.sh"

FAIL_COUNT=0

while true; do
    for DOMAIN in "${DOMAINS[@]}"; do
        adb_ping $DOMAIN
        if [ $? -ne 0 ]; then
            FAIL_COUNT=$((FAIL_COUNT + 1))
        else
            FAIL_COUNT=0
        fi

        if [ $FAIL_COUNT -ge $PING_FAILURE_THRESHOLD ]; then
            adb_toggle_data off
            logger "Data dimatikan setelah $FAIL_COUNT kegagalan"
            sleep 10 # Tunggu sebelum mencoba lagi
            adb_toggle_data on
            FAIL_COUNT=0
        fi
    done
    sleep $PING_INTERVAL
done
